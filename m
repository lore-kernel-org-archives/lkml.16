Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A43B1AB;
	Tue, 17 Jun 2025 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156153; cv=none; b=q7KO3QQ6N7rsnM8Xxfu8Qs4X9OMyuiYPku7bQ4RdNHXeqeJt8NEFbty5XWwHujXNNxkw8IfKq4wnDi0XBmNUxVsZWyVySPcCKKyowzxAHKum+3maJNCALZ9AIp3DRCV7A3o37YZUSdUbYdVRCqSobNdWU25sUe2kq0F4o8cfzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156153; c=relaxed/simple;
	bh=pnhUkbY2mgh5Xqb/2wQjNDvJKL6EEQEt1xGWbB9n4sI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=g96QU6YKRs/sGkZnDCM/6PttYj8SJYfrlVN7HJC+7xQxCZ3rbrLtKERSd9TM5q+uY/NLxR/Oy9pbbFSyTbHvd6O1+hWkcuog8fSK/qzjEj9I2ppwzr+HMeb4aSG7A6JkISxIdW9UyAorjkHp3wsxyM8GJ4RwaoObJU3F6QNLiFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=jn3HOQwW; arc=none smtp.client-ip=68.232.139.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="jn3HOQwW"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750156152; x=1781692152;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pnhUkbY2mgh5Xqb/2wQjNDvJKL6EEQEt1xGWbB9n4sI=;
  b=jn3HOQwWP+nTfxMkLNMQVVMo2EPC0mhnZ8E8bGWRiwNy8nQfEYeuZMsK
   qzwpXwuAqjt0w2T/TRAk0JGsMLGKz0EBnpvaqRiaguAUCz1nZpqj1fRLk
   sndsNf9x7Hao9pxzuchSNqQMrqHTGZGgG3MWawDFzW2r5ahUWKTBYi4jt
   /GCNuOgOR2hoqWN33c58qez9gZZppKrfZ2LnEZNdF2BbsXTpFfxZU/v4F
   54XMhEvVBFv/1SczvA3T+EYj+i08WHMjwY5XEdY592sPwbFhZvfQoLz/c
   Dw4HhJv6W+W3IwsjLl0bGkevR4/tRaFnsWfBbxyEa0TQceSe+zyoEktTv
   Q==;
X-CSE-ConnectionGUID: VEUI9cTvSfSIFjVhGcBRLA==
X-CSE-MsgGUID: NzL0bd6HTnmYL6vqzUql3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="206103682"
X-IronPort-AV: E=Sophos;i="6.16,243,1744038000"; 
   d="scan'208";a="206103682"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:29:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1820AE0ABD;
	Tue, 17 Jun 2025 19:29:01 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8859D765C;
	Tue, 17 Jun 2025 19:29:00 +0900 (JST)
Received: from sm-arm-grace07.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om2.fujitsu.com (Postfix) with ESMTP id 1D13B40045BEB;
	Tue, 17 Jun 2025 19:29:00 +0900 (JST)
From: Koichi Okuno <fj2767dz@fujitsu.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@fujitsu.com>
Subject: [PATCH v5 0/2] perf: Fujitsu: Add Uncore MAC/PCI PMU driver
Date: Tue, 17 Jun 2025 19:27:48 +0900
Message-ID: <20250617102819.3685543-1-fj2767dz@fujitsu.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds two new dynamic PMUs to the Perf Events framework to program
and control the Uncore MAC/PCI PMUs in Fujitsu chips.

These drivers were created with reference to drivers/perf/qcom_l3_pmu.c.

These drivers export formatting and event information to sysfs so they can
be used by the perf user space tools with the syntaxes:

perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
perf stat -e mac_iod0_mac0_ch0/event=0x80/ ls

perf stat -e pci_iod0_pci0/ea-pci/ ls
perf stat -e pci_iod0_pci0/event=0x80/ ls

FUJITSU-MONAKA PMU Events Specification v1.1 URL:
https://github.com/fujitsu/FUJITSU-MONAKA

Changes in v5:
- Update PMU events for FUJITSU-MONAKA to latest(v1.1) spec.
  The changed events are as follows:
  - Removed events:
    ea-memory-mac-read
    ea-memory-mac-pwrite
  - Description changed events:
    read-count-return
    read-count-return-pftgt-hit
    read-count-return-pftgt-miss
    ea-mac
    ea-memory
    ea-ha
    ea-pci
- Modify the code as suggested. (Jonathan Cameron)
  - Added include mod_devicetable.h.
  - EA events that share the same description as MAC events have been
    removed.
    These events will remain in the specification, but will be removed
    from the code.
    These events will be supported in future enhancements as the
    specification changes.
  - Changed MAC events with the same description to different
    description.
  - Changed some programming styles as suggested.
- Link to v4:https://lore.kernel.org/all/20250116045911.3382537-1-fj5100bi@fujitsu.com/

Koichi Okuno (2):
  perf: Fujitsu: Add the Uncore MAC PMU driver
  perf: Fujitsu: Add the Uncore PCI PMU driver

 .../admin-guide/perf/fujitsu_mac_pmu.rst      |  73 +++
 .../admin-guide/perf/fujitsu_pci_pmu.rst      |  50 ++
 Documentation/admin-guide/perf/index.rst      |   2 +
 drivers/perf/Kconfig                          |  18 +
 drivers/perf/Makefile                         |   2 +
 drivers/perf/fujitsu_mac_pmu.c                | 569 ++++++++++++++++++
 drivers/perf/fujitsu_pci_pmu.c                | 553 +++++++++++++++++
 7 files changed, 1267 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/fujitsu_mac_pmu.rst
 create mode 100644 Documentation/admin-guide/perf/fujitsu_pci_pmu.rst
 create mode 100644 drivers/perf/fujitsu_mac_pmu.c
 create mode 100644 drivers/perf/fujitsu_pci_pmu.c

-- 
2.43.0

