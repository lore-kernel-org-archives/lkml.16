Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A241E32DD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190720; cv=none; b=EuxVW9RdAAOMQzqQRpqHKCy93lt4+osmzth+iXzYoyoSvG9wvirg0XqpQZq1CAlA/QsdUL3v4rggmYF+ipHEdJaBXq8VZASZMlcTjRTXmHkCNCEaxl8U99fyVGMtYTn+aSPP2SHeZD1yW+MtT1LrQ2mzYy+CrvSYQNw37+uV8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190720; c=relaxed/simple;
	bh=81CLtOmC0RmDvklJIvppA+NmfesMVklV61PFIE/pcrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=gYqXgVTplv6+ty7G3BclyIDjJa6o6kEbXQeKH+V+n6Yye0SFK0xKooUlrDXPmduEL86Hwqd+cZXf7EQXqnxP6KibEcBKQYHbqCEHBQuIt1HFnZvZV4N11Z9l4OMFG1TpR2rUpG06GuVNXzsi98GiHi+bpMLLzxuav9cD8RsCvGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dDUsPcoo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dDUsPcoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aPYEBolGkAf+sLLKEgEIwtTazseXBI5R66S//AmPrAQ=;
	b=dDUsPcooSqm1pau1qmnkOaBiI6oUcEqNZViKpWjsHidvUh7o1Btqu1UWqMRGIphKEffwpH
	NNSTS/n5H25uB9I/xKa9k4zark8yCeb4uNusDMCEe9grt5L2zuF7J3WZcZXd4seRYTcEVr
	0MvRaW8YfxeYUYuTQJYfEbi9Nb6zBsw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-JLtafciQNr-tdUaIGXvj7A-1; Fri,
 28 Mar 2025 15:38:34 -0400
X-MC-Unique: JLtafciQNr-tdUaIGXvj7A-1
X-Mimecast-MFC-AGG-ID: JLtafciQNr-tdUaIGXvj7A_1743190713
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E373180AF5C;
	Fri, 28 Mar 2025 19:38:32 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F4461828A84;
	Fri, 28 Mar 2025 19:38:28 +0000 (UTC)
From: John Meneghini <jmeneghi@redhat.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me
Cc: loberman@redhat.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	emilne@redhat.com,
	jmeneghi@redhat.com,
	bgurney@redhat.com
Subject: [PATCH v3 0/5] nvme: make core.nvme_multipath configurable 
Date: Fri, 28 Mar 2025 15:38:21 -0400
Message-ID: <20250328193826.356257-1-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

As agreed at LSF/MM here is a v3 patch set which includes the 
new CONFIG_NVME_ENABLE_MULTIPATH_PARAM option.

NOTE: we agreed to call this CONFIG_NVME_DISBALE_MULTIPATH_PARAM.
However, during testing I realized that we needed to make the 
logic positive or else many of the default make 'config' rules
would produce the wrong results. 

For example:

 make localmodconfig
 make allmodconfig 

would end up compiling out the core_nvme.multipath
parameter, and I don't think this is what we want.

To remove the core.nvme_multipath one needs to 
explicity overide the default setting by saying
CONFIG_NVME_ENABLE_MULTIPATH_PARAM=n.

The current default setting for this option is

  CONFIG_NVME_ENABLE_MULTIPATH_PARAM=y.

To remove the core_nvme.multipath one needs to 
explicity overide the default setting by saying
CONFIG_NVME_ENABLE_MULTIPATH_PARAM=n.

Keith, I suggest that we add these to nvme-6.16 since there are a few
more changes than I had planned for. I'd like these patches to get some
soak time before they merge.

Closes: https://lore.kernel.org/linux-nvme/20241121220321.40616-1-bgurney@redhat.com/
Closes: https://lore.kernel.org/linux-nvme/20250204211158.43126-1-bgurney@redhat.com/
Closes: https://lore.kernel.org/linux-nvme/20250228032541.369804-1-jmeneghi@redhat.com/ 

Signed-off-by: John Meneghini <jmeneghi@redhat.com>

Changes Since v2

Changed the patch order and added:

  nvme: add NVME_ENABLE_MULTIPATH_PARAM for loongarch
  nvme: add NVME_ENABLE_MULTIPATH_PARAM for powerpc skiroot

I'm not 100% sure these two are needed but it would be
better to be safe than sorry. 

  nvme-multipath: add the NVME_ENABLE_MULTIPATH_PARAM config option

Changed the name of this config option from 
NVME_MULTIPATH_PARAM to NVME_ENABLE_MULTIPATH_PARAM and
Fixed up the Kconfig description.

Tested the following make options:

  make localmodconfig
  make alldefconfig
  make mod2noconfig
  make allyesconfig
  make allmodconfig
  make olddefconfig
  make oldconfig - accept all defaults

These all provide no change in current behavior.

Changes Since v1

Rebased patches to nvme-v6.15

  nvme: add mulitipath warning to nvme_alloc_ns

Dropped this patch because the dmesg it produced was redundant and not
needed. Testing multiport devices with CONFIG_NVME_MULTIPATH disabled
show the following console message at boot.

[167523.157284] nvme nvme5: Found shared namespace 1, but multipathing not supported.
[167523.217083] nvme nvme6: Please enable CONFIG_NVME_MULTIPATH for full support of multi-port devices.

  nvme-multipath: add the NVME_MULTIPATH_PARAM config option

Fixed up the Kconfig description for NVME_MULTIPATH_PARAM.
Add default y and tested the follow Kconfig options.

Tested the following:

  make mod2noconfig
  make allyesconfig
  make allmodconfig
  make olddefconfig
  make oldconfig - accept all defaults

No change in current behavior.

  nvme: update the multipath warning in nvme_init_ns_head

Tests ran with CONFIG_NVME_MULTIPATH=y and CONFIG_NVME_MULTIPATH_PARM=n

No change in current behavior except:

  [root@rhel-storage-108 ~]# cat /sys/module/nvme_core/parameters/multipath
  cat: /sys/module/nvme_core/parameters/multipath: No such file or directory
  
The following does nothing, just like it does when CONFIG_NVME_MULTIPATH=n

  [root@rhel-storage-108 ~]# grubby --update-kernel=ALL --args="nvme_core.multipath=N"
  [root@rhel-storage-108 ~]# reboot now
  .
  .
  .
  [root@rhel-storage-108 ~]# cat /proc/cmdline
  BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.14.0-rc2_config_ana4a+ ...  nvme_core.multipath=N
  [root@rhel-storage-108 ~]# cat /sys/module/nvme_core/parameters/multipath
  cat: /sys/module/nvme_core/parameters/multipath: No such file or directory

Tests ran with CONFIG_NVME_MULTIPATH=y and CONFIG_NVME_MULTIPATH_PARM=y

  There is no change in current behavior:

Tests ran with CONFIG_NVME_MULTIPATH=y, CONFIG_NVME_MULTIPATH_PARM=y
and nvme_core.multipath=N

  [  372.040105] nvme nvme4: Found shared namespace 1, but multipathing not supported.
  [  372.047606] nvme nvme4: Shared namespace support requires core_nvme.multipath=Y.
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			                   new message
  [  372.105469] nvme nvme5: creating 2 I/O queues.
  [  372.110383] nvme nvme5: mapped 2/0/0 default/read/poll queues.
  [  372.125480] nvme nvme5: new ctrl: NQN ....
  [  372.166081] nvme nvme5: Found shared namespace 1, but multipathing not supported.
  [  372.235964] nvme nvme6: creating 2 I/O queues.
  [  372.240926] nvme nvme6: mapped 2/0/0 default/read/poll queues.
  [  372.255964] nvme nvme6: new ctrl: NQN ....
  [root@rhel-storage-108 ~]# cat /sys/module/nvme_core/parameters/multipath
  N
  [root@rhel-storage-108 ~]# grubby --remove-args="nvme_core.multipath=N" --update-kernel=ALL
  [root@rhel-storage-108 ~]# grubby --info=ALL | grep nvme_core 
  [root@rhel-storage-108 ~]# reboot now
  .
  .
  .
  [root@rhel-storage-108 ~]# cat /sys/module/nvme_core/parameters/multipath
  Y



John Meneghini (5):
  nvme: update the multipath warning in nvme_init_ns_head
  nvme: change the NVME_MULTIPATH config option description
  nvme: add the NVME_ENABLE_MULTIPATH_PARAM config option
  nvme: add NVME_ENABLE_MULTIPATH_PARAM for loongarch
  nvme: add NVME_ENABLE_MULTIPATH_PARAM for powerpc skiroot

 arch/loongarch/configs/loongson3_defconfig |  1 +
 arch/powerpc/configs/skiroot_defconfig     |  1 +
 drivers/nvme/host/Kconfig                  | 24 ++++++++++++++++++----
 drivers/nvme/host/core.c                   |  2 +-
 drivers/nvme/host/multipath.c              |  2 ++
 5 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.48.1

