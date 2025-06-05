Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0F1FDE31
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101110; cv=none; b=drOYRWp2beD9RPklHgSepaSQEAmEVa6DH/nP2CC7pIGLJXQGLNQlnypHf4ZSMZp43WjWZH0wMWVTI9rIUQDRuEoZhEvQsd7QbFNGgyUsnUZDLu5fY53ucqc/fa9jf/N7yNuUGHe0EXsE2Lea8W2hdsaJVusktgeD3gE7rkgbVEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101110; c=relaxed/simple;
	bh=vlJXvAa9X+ezoDZ5kkgtL0pzbm0tSOq3EooVS4mttsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXutKXNlqFNCXLN08+QZla9ltE3WGdA6BRSz91fRPj6/QO7u/w8Rl/dvpMI3b5xkV3peRo8QlcwQSyfdz7Ji7ky0vCfhy2bQ0E0HLeP22WzASnQDQDpiTvKV6T04QNZeu4boUGfH80uVJV3052uyldNjiH6zkhYfZFMGougWd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEBsW1WD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEBsW1WD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554HBuYw004238
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 05:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOXtSog1QDveCNyYwT9jqHDvpBgbfVSj3rU4ri3NmDo=; b=mEBsW1WDRqFshoHA
	uTzUhVdfE64SiFtIzd6/gTGhfQWonSx9pDB5NasrBvxjTXTPaTZq8P6kV//UuVkT
	qVrRpNngnSTFHA1raEa6gkgiQV3XrkwvKUqTY3CjXDgQw3GdmZ1t3johfnSP/ZgX
	4a5c0lHCCQ5IBYMA0RQqlyGZ0sD+EsNzzKpnMiA9OM6w0+EH+l4MfT7xyY2pehdi
	ozOW1KSGK5TVKSsYqOcYdsux6UfOataj+UAbIFWTYsc77DSBkgpcdnDDhHQ/jfAl
	hYWLkdmnL6PjCUHYxKffyYpfWi2xSD6W1+4s9EGC3jKEW+yFKvJG3biv+SyajKh+
	5rcwSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s07ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:25:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-312eaf676b3so851272a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101107; x=1749705907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOXtSog1QDveCNyYwT9jqHDvpBgbfVSj3rU4ri3NmDo=;
        b=uzFCM7rw38HBeChRzO0kOMl9oBrd9sID3WJPOIDJZG8jCf+35EU+6hJbBXOQesLY5t
         syqmxBdPArpHZMBmFSwtg8nmi7m/wU35gaVkJb+392+Q3cEF7JT4hokU7Ui+1JRVkeLB
         DpBkuzGa1+Aec3nummuBebC7BzOmf8bFqFFCL8y4N5qMSj9PR5T4tkTJ03D1HZs1JVTf
         GYG6QG1WmX3mwvQNVqJak85C1HlBPoVOS4swkN1o50lgNoBoTlUDTg9V4y5pS5DpOgya
         UJeboMJCLY2jiVzzpbsFijcLdshGZpe9rtVo/H+oewb7FhdX0G4D0/u3LGTscLN91ZUn
         yFEg==
X-Forwarded-Encrypted: i=1; AJvYcCV2YO6aZoe2hChsNLpQCnOSKSCTjn53xdj69ZoBXvCjj7N60SG6Q95ixnwR9eMGUn2BIChlsIMEfoTbfLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MOpkLgzRpRoFVZQoLY7ppphUZbuyI1OtSiDArwHsh43G2MnS
	bfR5SuOmkNtBG9Tp97XELYVJmLtLDPKTOlqaljQP+Fqq1D6AxE3YeWbtUPwBQO4/OlTqe0ow4zo
	MIjhigNrBy9aAQ1VIcgkwgr7muqZRVne3jOqkofTTC45xc4ljCaiSqImPBGjSo1YUWsk=
X-Gm-Gg: ASbGnctdR7BpEOxtJI5Lu7bA0o/Gy7uO1Bz3PDf6l0U8yoFLJo2RWBfMqm/6GzmZE/s
	mVEcwvGa2C569mu2wbN6z2u2TmUqPcHZfyX7m+Wc4wKIDD9+SRJEVmxssSz4lxxJgj4OuHkkti5
	0fMUStVIcInLr59KEhNUmOw0QJEtUTqz+8KqyWY4wxUnToRbgZD3wID5gd+u1jNYxb/ACxjxCav
	0MjoKx9G+NKYzmK9vUsH44Q/LgXOnacK0KXTlPKN920VdQc60Wn3XxUhSg3hEQreXVSWKd468Ul
	rNBdP+FCguCcCxXuWq3gazmFj9xunt6FUUQeMd108Sy5Cyk=
X-Received: by 2002:a17:90b:52c6:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-3130cd67f87mr7348328a91.23.1749101106955;
        Wed, 04 Jun 2025 22:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGizPUuInvJsfPhGgAodQGX82jrYIhBDW3+fyLJE7myE9Z/9iGHSaKGIpVNnw9+dcwQ6gmrMw==
X-Received: by 2002:a17:90b:52c6:b0:312:1d2d:18df with SMTP id 98e67ed59e1d1-3130cd67f87mr7348282a91.23.1749101106412;
        Wed, 04 Jun 2025 22:25:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0ad55csm621815a91.40.2025.06.04.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:25:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 10:54:45 +0530
Subject: [PATCH v3 2/2] PCI/portdrv: Add support for PCIe wake interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-wake_irq_support-v3-2-7ba56dc909a5@oss.qualcomm.com>
References: <20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com>
In-Reply-To: <20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749101092; l=5481;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vlJXvAa9X+ezoDZ5kkgtL0pzbm0tSOq3EooVS4mttsg=;
 b=+u3TTrTXFx8RDNANNurLLF+fnnpi0DJrWjY6QqkCiRbl4RP7ve/2ANlZxpia7e9xsxF4S9N7P
 ketU6RZ+8BoBbPrH5VNtMwAfMDhwgmizFzSGxHCPQe4R3h+LZ+A/cz9
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: _jHZfaUtPOrAvXPPvhULh7zVIccqoNHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NSBTYWx0ZWRfX3Jrfi6LDeZca
 8BvlZ1l2zPKq2qbd4Z3tdx2XmX6oOHrc54YMDE8R+J4B7mFyb+5vY8dNYagq+PQ0OafUzKeGAky
 Amt/y5Lo8K+Uk63JL90Ujke3dxdSuxRIP/6M9JKYcdLsDO/yAvbTbEwsl1fNrZGUKjh+ePZnthX
 dEu6RJX+ZHIeOcdfXnHUP31F2lufF6an9jL17vW9Mwu3H1/mRconC+eHA6zKYWMpHPPvkbTyLG1
 4m4jAuC8pxT7kIXxZdRAogCTUIMTBoGjADRLSN3mglN9uM4s6v/0/mYCPErxpz9BAkHhlhN8wpq
 EGnKUDXXi5DUWRqjHL0ql4zbGgZzSyMjAjUVlfpCsdpYGrUOB1elk7I7m7uZdFAo8puuS9fr09a
 af25sPLtdKUjLe7V262+9NtOiJ+zMuNLaOzlglxkNx4CzbM0/0ukdlanqz5Nqsoli0jsCrW/
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=68412a33 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=4qw4IQhyAdn_hH04eJkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: _jHZfaUtPOrAvXPPvhULh7zVIccqoNHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050045

PCIe wake interrupt is needed for bringing back PCIe device state
from D3cold to D0.

Implement new functions, of_pci_setup_wake_irq() and
of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
using the Device Tree.

From the port bus driver call these functions to enable wake support
for bridges.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/pci/of.c           | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h          |  6 +++++
 drivers/pci/pcie/portdrv.c | 12 ++++++++-
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index ab7a8252bf4137a17971c3eb8ab70ce78ca70969..3487cd62d81f0a66e7408e286475e8d91c2e410a 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -966,3 +968,68 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
 	return slot_power_limit_mw;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
+
+/**
+ * of_pci_slot_setup_wake_irq - Set up wake interrupt for PCI device
+ * @pdev: The PCI device structure
+ *
+ * This function sets up the wake interrupt for a PCI device by getting the
+ * corresponding WAKE# gpio from the device tree, and configuring it as a
+ * dedicated wake interrupt.
+ *
+ * Return: 0 if the WAKE# gpio is not available or successfully parsed else
+ * errno otherwise.
+ */
+int of_pci_slot_setup_wake_irq(struct pci_dev *pdev)
+{
+	struct gpio_desc *wake;
+	struct device_node *dn;
+	int ret, wake_irq;
+
+	dn = pci_device_to_OF_node(pdev);
+	if (!dn)
+		return 0;
+
+	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
+				     "wake", GPIOD_IN, NULL);
+	if (IS_ERR(wake) && PTR_ERR(wake) != -ENOENT) {
+		dev_err(&pdev->dev, "Failed to get wake GPIO: %ld\n", PTR_ERR(wake));
+		return PTR_ERR(wake);
+	}
+	if (IS_ERR(wake))
+		return 0;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		dev_err(&pdev->dev, "Dailed to get wake irq: %d\n", wake_irq);
+		return wake_irq;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
+	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
+		device_init_wakeup(&pdev->dev, false);
+		return ret;
+	}
+	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_pci_slot_setup_wake_irq);
+
+/**
+ * of_pci_slot_teardown_wake_irq - Teardown wake interrupt setup for PCI device
+ *
+ * @pdev: The PCI device structure
+ *
+ * This function tears down the wake interrupt setup for a PCI device,
+ * clearing the dedicated wake interrupt and disabling device wake-up.
+ */
+void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+}
+EXPORT_SYMBOL_GPL(of_pci_slot_teardown_wake_irq);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 39f368d2f26de872f6484c6cb4e12752abfff7bc..dd7a4da1225bbdb1dff82707b580e7e0a95a5abf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
 void pci_set_bus_of_node(struct pci_bus *bus);
 void pci_release_bus_of_node(struct pci_bus *bus);
 
+int of_pci_slot_setup_wake_irq(struct pci_dev *pdev);
+void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev);
+
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 
@@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
 	return 0;
 }
 
+static int of_pci_slot_setup_wake_irq(struct pci_dev *pdev) { return 0; }
+static void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev) { }
+
 static inline bool of_pci_supply_present(struct device_node *np)
 {
 	return false;
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index e8318fd5f6ed537a1b236a3a0f054161d5710abd..9a6beec87e4523a33ecace684109cd44e025c97b 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -694,12 +694,18 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
 	     (type != PCI_EXP_TYPE_RC_EC)))
 		return -ENODEV;
 
+	status = of_pci_slot_setup_wake_irq(dev);
+	if (status)
+		return status;
+
 	if (type == PCI_EXP_TYPE_RC_EC)
 		pcie_link_rcec(dev);
 
 	status = pcie_port_device_register(dev);
-	if (status)
+	if (status) {
+		of_pci_slot_teardown_wake_irq(dev);
 		return status;
+	}
 
 	pci_save_state(dev);
 
@@ -732,6 +738,8 @@ static void pcie_portdrv_remove(struct pci_dev *dev)
 
 	pcie_port_device_remove(dev);
 
+	of_pci_slot_teardown_wake_irq(dev);
+
 	pci_disable_device(dev);
 }
 
@@ -744,6 +752,8 @@ static void pcie_portdrv_shutdown(struct pci_dev *dev)
 	}
 
 	pcie_port_device_remove(dev);
+
+	of_pci_slot_teardown_wake_irq(dev);
 }
 
 static pci_ers_result_t pcie_portdrv_error_detected(struct pci_dev *dev,

-- 
2.34.1

