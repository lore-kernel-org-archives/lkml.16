Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3E0189B91;
	Wed, 14 May 2025 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205185; cv=none; b=Bhf7zc1AS/bJGhiRo/VIG78K0wOGzAqzTrIZlGSKnWs1sL0HROCeeRNbrMOkRa/G2jnPG1PlcS8nGXDiGXslZosIwn4Ud9XsU7FovPazeP9caO9tC9HeUDlAmkgZTSE0KDYyLU7g7vtjbhaG7tZZih+zcMxf24DCjGstnFxCkp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205185; c=relaxed/simple;
	bh=8tA1fys/tC/txn/SvFvhwC60414BfXMKWdkIhqp9x1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UbCc2qEIqHkaQncQ2/XhaBXef72UY5Jc5ryn/dFmYC7brRVsa3XRTcZNt9wH+qDpjkO3V1OGTdpr4+AC7smduMBxIQwalX42FunKDd1e0t5wgxm6+jeNTyCvOBC7VtgNdee4uWJQ2TNA0s5ShF1/YMbz//TLSHKvsWTIsDe4Qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GRjP9IeA; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GRjP9IeA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nI
	/FoVDDiqNB9hu55eRMWGpCbteAx6pAjc3lUMHBE7A=; b=GRjP9IeA6kkbMaNZPY
	UVlX7SmP9D3bCYJLD7TvCOuDV+27GcdX5APgCxDNCCwrrxfLpS8uRXZGYV0JC090
	ruYdC0btAIA0zVTFhtdhNpjgBEvtuhnIZFyrxT/laOLvLkCaTHk1857J1iXfsLq+
	O2QfJmigNYwn7qJCVraqmiqKk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnD9_nOyRokt5JAQ--.20105S4;
	Wed, 14 May 2025 14:45:10 +0800 (CST)
From: David Wang <00107082@163.com>
To: gregkh@linuxfoundation.org,
	mathias.nyman@intel.com
Cc: oneukum@suse.com,
	stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for host-controller private data
Date: Wed, 14 May 2025 14:44:55 +0800
Message-Id: <20250514064455.5488-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250513113817.11962-1-00107082@163.com>
References: <20250513113817.11962-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnD9_nOyRokt5JAQ--.20105S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Wr1fGF4Dtr4UKF47tFy7ZFb_yoWxZFWxpr
	4fJwn7AF1DtrnrJr4UJF1DWr1UJw18Zr1UXF13try8Zr1UAw1UAr18Cr1rJry7Ary8JF1U
	Xr1UJr1UJr1UJFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USNtsUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBFNqmgkNjHJNgAAsS

Hi, 

Update memory footprints after hours of USB devices usage
on my system:
(I have webcam/mic/keyboard/mouse/harddisk connected via USB,
a full picture of memory footprints is attached below)
+----------------------+----------------+-------------------------------------------+-----------------------+
| active memory(bytes) | active objects |               alloc location              | total objects created |
+----------------------+----------------+-------------------------------------------+-----------------------+
|        22912         |       24       | core/urb.c:1054:urb_hcpriv_mempool_zalloc |         10523         |
|        11776         |       31       |        core/urb.c:76:usb_alloc_urb        |         11027         |
+----------------------+----------------+-------------------------------------------+-----------------------+

The count for active URB objects remain at low level,
its peak is about 12KB when I copied 10G file to my harddisk.
The memory pool in this patch takes about 22KB, its peak is 23KB.
The patch meant to reuse memory via a mempool, the memory kept in pool is indeed
the "tradeoff" when the system is idle. (Well, we are talking about mempool anyway.)
How balance the tradeoff is depends on how well the mempool is managed.
This patch takes a easy approach: put faith in URB objects management and put
a single slot of mempool in URB on demands. And the changes, by counting lines
in this patch, are very simple.
Base on the profiling, the number of active URB objects are kept at a very low scale,
only several could have a very long lifecycle.
I think URB is a good candidate for caching those memory needed for private data.
But I could be very wrong, due simply to the lack of knowledge.

And before, without the patch, a 10 minutes webcam usage and copying 10G file to harddisk
would yield high rate of memory allocation for priviate data in xhci_urb_enqueue:
+----------------------+----------------+-----------------------------------+-----------------------+
| active memory(bytes) | active objects |           alloc location          | total objects created |
+----------------------+----------------+-----------------------------------+-----------------------+
|        22784         |       23       | host/xhci.c:1555:xhci_urb_enqueue |         894281 << grow|ing very quick
|        10880         |       31       |    core/urb.c:75:usb_alloc_urb    |          4028         |
+----------------------+----------------+-----------------------------------+-----------------------+
I observe a highest allocation rate of 1.5K/s in xhci_urb_enqueue
when I was copying 10G file, and had my webcam opened at the same time.

And again, to be honest, I did not observe any observable performance improvement from
an enduser's point of view with this patch. The only significant improvement is memory footprint
_numbers_.
I guess memory allocation is indeed "_really damn fast_", but I still have the mindset of
"the less allocation the better".


Full drivers/usb memory footprint on my system with this patch:
(The data was collected via memory profiling: https://docs.kernel.org/mm/allocation-profiling.html)
+----------------------+----------------+------------------------------------------------------+-----------------------+
| active memory(bytes) | active objects |                    alloc location                    | total objects created |
+----------------------+----------------+------------------------------------------------------+-----------------------+
|        40960         |       5        |      host/xhci-mem.c:951:xhci_alloc_virt_device      |           10          |
|        26624         |       26       |      core/port.c:742:usb_hub_create_port_device      |           26          |
|        24576         |       2        |     host/xhci-mem.c:2170:xhci_setup_port_arrays      |           3           |
|        22912         |       24       |      core/urb.c:1054:urb_hcpriv_mempool_zalloc       |         10523         |
|        21504         |       21       |        core/endpoint.c:157:usb_create_ep_devs        |           31          |
|        18432         |       9        |             core/usb.c:650:usb_alloc_dev             |           10          |
|        16384         |       4        |           core/hcd.c:2553:__usb_create_hcd           |           4           |
|        13312         |       13       |      core/message.c:2037:usb_set_configuration       |           14          |
|        11776         |       31       |             core/urb.c:76:usb_alloc_urb              |         11027         |
|         9216         |       9        |       core/config.c:930:usb_get_configuration        |           10          |
|         5120         |       5        |              core/hub.c:1938:hub_probe               |           5           |
|         5120         |       2        |     host/xhci-mem.c:2156:xhci_setup_port_arrays      |           3           |
|         2560         |       5        |   host/xhci-debugfs.c:578:xhci_debugfs_create_slot   |           10          |
|         2416         |       16       |        host/xhci-mem.c:49:xhci_segment_alloc         |           44          |
|         2176         |       17       |         host/xhci-mem.c:377:xhci_ring_alloc          |           38          |
|         2112         |       22       |      core/port.c:746:usb_hub_create_port_device      |           26          |
|         2048         |       32       |        host/xhci-mem.c:38:xhci_segment_alloc         |           73          |
|         1728         |       18       |   host/xhci-debugfs.c:90:xhci_debugfs_alloc_regset   |           26          |
|         1632         |       17       |        core/config.c:619:usb_parse_interface         |           18          |
|         1504         |       9        |       core/config.c:967:usb_get_configuration        |           10          |
|         1312         |       13       |      core/config.c:820:usb_parse_configuration       |           14          |
|         1024         |       1        |        host/xhci-mem.c:812:xhci_alloc_tt_info        |           2           |
|         704          |       24       |         core/message.c:1032:usb_cache_string         |           27          |
|         512          |       8        | host/xhci-debugfs.c:438:xhci_debugfs_create_endpoint |           22          |
|         320          |       10       |     host/xhci-mem.c:461:xhci_alloc_container_ctx     |           30          |
|         272          |       2        |        host/xhci-mem.c:1635:scratchpad_alloc         |           3           |
|         224          |       5        |            core/hub.c:1502:hub_configure             |           5           |
|         192          |       4        |   host/xhci-mem.c:2121:xhci_create_rhub_port_array   |           6           |
|         192          |       2        |     host/xhci-mem.c:2263:xhci_alloc_interrupter      |           3           |
|         160          |       2        |     host/xhci-mem.c:2198:xhci_setup_port_arrays      |           3           |
|         128          |       2        |          host/xhci-mem.c:2506:xhci_mem_init          |           3           |
|         128          |       2        |      core/config.c:1063:usb_get_bos_descriptor       |           3           |
|         128          |       2        |      core/config.c:1058:usb_get_bos_descriptor       |           3           |
|          80          |       5        |            core/hub.c:1454:hub_configure             |           5           |
|          72          |       9        |       core/config.c:935:usb_get_configuration        |           10          |
|          64          |       2        |        host/xhci-mem.c:1624:scratchpad_alloc         |           3           |
|          64          |       2        |           core/hcd.c:2565:__usb_create_hcd           |           2           |
|          64          |       2        |           core/hcd.c:2557:__usb_create_hcd           |           2           |
|          40          |       5        |        host/xhci-mem.c:2039:xhci_add_in_port         |           6           |
|          40          |       5        |            core/hub.c:1447:hub_configure             |           5           |
|          40          |       5        |            core/hub.c:1441:hub_configure             |           5           |
|          0           |       0        |            core/message.c:529:usb_sg_init            |         10137         |
|          0           |       0        |          core/message.c:144:usb_control_msg          |          793          |
|          0           |       0        |            core/hcd.c:491:rh_call_control            |          449          |
|          0           |       0        |       host/xhci-mem.c:1705:xhci_alloc_command        |          234          |
|          0           |       0        |       host/xhci-mem.c:1711:xhci_alloc_command        |           97          |
|          0           |       0        |            core/message.c:980:usb_string             |           31          |
|          0           |       0        |         core/message.c:1028:usb_cache_string         |           27          |
|          0           |       0        |          core/message.c:1145:usb_get_status          |           19          |
|          0           |       0        |    core/message.c:1061:usb_get_device_descriptor     |           14          |
|          0           |       0        |      core/message.c:2031:usb_set_configuration       |           10          |
|          0           |       0        |            core/hub.c:4883:hub_port_init             |           10          |
|          0           |       0        |       core/config.c:939:usb_get_configuration        |           10          |
|          0           |       0        |         core/hub.c:5311:descriptors_changed          |           4           |
|          0           |       0        |      core/config.c:1037:usb_get_bos_descriptor       |           3           |
|          0           |       0        |           storage/usb.c:540:associate_dev            |           1           |
+----------------------+----------------+------------------------------------------------------+-----------------------+

FYI
David

