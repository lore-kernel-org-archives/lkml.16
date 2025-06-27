Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3DD2A8D0;
	Fri, 27 Jun 2025 06:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004129; cv=none; b=APi8nEX0HBf5wXwHOFlnipQLCHkRv0tDdu+pH+WA33JlYe+a5+gWbaT6NaKu15ZRfQO8nIGkDmFH6outyFtgmRa+4jURTeQEdkZbdzSdhr/aDBxHEBd8nH2o5JW714jXhOowPDHu4SKppetx/R7jMUFfOorDdrxgnHfsf/Qs4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004129; c=relaxed/simple;
	bh=ogN7BOJjusZykPC2d4jgfrZ5u9Lpq0n8KQ7kVvUgCQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSCwS/zcwRHDkMryPn4kRFpOM6Cccx4fYxlIYnoQo+JX76Opyd3dcf57EZijeumIOl/Er78dvxQcmyrWQmBmaG08IgOCutLKGxxmd/ROf7avg3NfvvqEUpGPNGTL6VyRgCEl1Sy8gFEtCYAP1Q9bN1nKWZ/SwjtCLTQJB2A5C94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+3yqIHP; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+3yqIHP"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7387f21daadso1539377a34.0;
        Thu, 26 Jun 2025 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751004127; x=1751608927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z16CFT0X6xgp0nREGCa3KxiUGJB2mesoFi2mvUmMQZE=;
        b=Y+3yqIHP4jcAZIeXvO6sarZqPb3baRWTiLY1TRbpCvppLWYltwXFGV0burVHv3rBqw
         ii/Tl1Gt2C2brp4TyMaOsk6ksXHW5YmNMGRnDqj9gqwIEkUzWLAVXic3ogALW35vuGmG
         oP3Bub+cvKFp75OBWRKTVm87LNE/FuvWNSL4SnVMibte8UVJaJExpm/KI/ZkJi6afqyf
         XP5QR7YSmC4j7wZj/m/NsphAHeB6oPm6RYMjkW/CWbZgD4bxb+hOlaHdo/8ixKH2i5bR
         4dIWZ0zRySonCOxY7JwOx9314hEXqP65B006rTZ1s4z6qMtlSeosJS0tq73I1VOGE6g8
         +aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751004127; x=1751608927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z16CFT0X6xgp0nREGCa3KxiUGJB2mesoFi2mvUmMQZE=;
        b=OT6bnTZ7o/MVvoHsFfjI4PCsYzKhV4JjfT4Uqs3xORkvu0sy/rWxz3sbebCGceOVsJ
         C8CaXbc+bELWy1drngcfn0V4yVmX7uubO39dtTa5pKhRv1FoXCmidwO2GHV4QMefj3B0
         kgffcJT7vYs3UM7FHUJ8NINf1CsrWJq0hhdW0M8FY1a6kTiLHg4ZiucSwYhaaiyPnumm
         HTOB0ERdr6c9zZG1IGev+10k9dd5VDF5+AdVmiZepVzVQCqtlrbG6I0PVqeniBS4cJAH
         ySDhHYibVGmP7DEblIzSLXVO7g/qWHERtK40R7oH4LvOWl7/pIfseKrDhzTGJH7KoQsK
         Ithw==
X-Forwarded-Encrypted: i=1; AJvYcCUvJrntBX+JDyzG6Mg3GrNx+s2zZbPRvpcGRxzecqnOvTzMJSuR9U7PEpnU7VA+l3n5IR4zKy2dDB4nNdM=@vger.kernel.org, AJvYcCVgFeuYm45osvir/0G4EYf/QIZvtYbxCOmJMW1HZwlX6nhuarShRPOdZYGVOlB4OWLlRNVDfvyJUpjB@vger.kernel.org
X-Gm-Message-State: AOJu0YxnrhF0UGCzusBLA7ETUgDC/2dNnab5mH1x1HlhMQ4XutDIpCjC
	5fDLFHh7y7JKC3laA+FswTXk3WrTAlXFFfHzx41FUXyQaewygSdEJ8ad
X-Gm-Gg: ASbGncso6x1r2EWx+eK009EUsrS2Q37cu54DQYRqM/+a96TN4I3ubCbkRNTwFEERp6i
	gBqBrbMRANRTXuQ77zbw/4rwwTjnzfLtoDnYSNHIIu1xh6H+yagl6Z4J00LGEnv03rvnrSoMucv
	IpBVmU1IJmQN1Xtsu0XC+RSn9o1ssBBaLF24O7liW0CZ7U/QeE1NX0r7FdCcTJEwMdO0gaBEBDW
	frQc7RpLvDusoVEn7DNauTQ8u/pI9EokAfomohe9LKfj3XrAt8tQ1E+8WfTfn0dEzAtC/6EViSQ
	Fv+zJ/1A2teP+BEAFhEGGE78kF/nIrnEhLT0YtGC0A2zH01Q1ZCEM/N31SHWlEbq
X-Google-Smtp-Source: AGHT+IGDf5B3X19G7dGXS0IC17ZqTS+7dOnmBelH5PQyqTyVwxjOWGD+13q1TS3hyyCtPCJMgMSHxQ==
X-Received: by 2002:a05:6871:5b20:b0:2ea:9932:f1ac with SMTP id 586e51a60fabf-2efcf0616famr4235808fac.12.1751004127129;
        Thu, 26 Jun 2025 23:02:07 -0700 (PDT)
Received: from s-machine2.. ([2806:2f0:5501:d07c:4b96:6387:264e:4984])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea6b86sm748729fac.1.2025.06.26.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:02:06 -0700 (PDT)
From: Sergio Perez Gonzalez <sperezglz@gmail.com>
To: gregkh@linuxfoundation.org,
	michal.simek@amd.com
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH] usb: gadget: udc-xilinx: validate ep number before indexing rambase[]
Date: Fri, 27 Jun 2025 00:01:22 -0600
Message-ID: <20250627060125.176663-1-sperezglz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue flagged by coverity. The size of the rambase array is 8,
usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.

Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 8d803a612bb1..0c3714de2e3b 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
 	/* Bit 3...0:endpoint number */
 	ep->epnumber = usb_endpoint_num(desc);
+	if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
+		dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
+				ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
+		return -EINVAL;
+	}
+
 	ep->desc = desc;
 	ep->ep_usb.desc = desc;
 	tmp = usb_endpoint_type(desc);
-- 
2.43.0

