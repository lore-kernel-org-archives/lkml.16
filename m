Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0A2D63E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633388; cv=none; b=NBucUdXyeMHw0DSBvLmt0+sWFSvHGBo0HsoxEi4cFW5Y2kI/0pAW9Eq6/yHhZNCQdiSeMAdXS9asXBRAw9O/MmCXyCzhzPbHqajS0fCbSWS9lOKx5/+bd1H0VXHM8A2I7NbsW0Bizn4hTOE9sGAbfjs3BMmgtxFdpKmZXCkH5Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633388; c=relaxed/simple;
	bh=sTUBRJVoeWRs+wu7qHPOtifoG3ppcajjA9BZC6iQa+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNX7hHxoD8W7PxkM3FLmtr4De5StFW5DMiiDZf9OdBAU8FGIcbvfUQu4FB35M68K0+sYwbhpyKXO7qpikRlaptV4Dbsi4GNTbET7tl19IenBxeL0jTOn/tCyE4GXB13APpjvBXXtUGDn7SIAHZvBBweMhI24S7kOuJNH3/zkcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYwI4cIQ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYwI4cIQ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b4b03e0a7so1098901fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751633384; x=1752238184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHKefJ+xQH5LvP5tNIrJQVR+u5n8WdQMjSo3MqCjOD4=;
        b=pYwI4cIQXOvWxF6TVl0soY5kzwP7lX3wB8RnlFUlTGhXvElV1uszBn9P1rYAOIIfzO
         ew5bXSBh76tmUxZzPWxBEJ6DH67CN/xyWxCFbIUvCqBympkGCWaQVChJSRLC2vhuAGBb
         rFsUGAa3ITcJ57bfaCRRD2E2LwBGmVcGkOCsjwBpDsNLx/KVu+tplb6zNIR/e2QvoKOd
         MjsbI/SjkU0ifUpTqOUsj8ZUunlrIcqLB3dH4bkiXSwd61Dl5EtPGdd81kabtkkb1cQ8
         8CK0OUSYgRHS4Mk4Fp13qe/7+oumHp6MyWmw3HFSmJPvrKWZ7+4VQe26iyTBTQz1xjBz
         fiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751633384; x=1752238184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHKefJ+xQH5LvP5tNIrJQVR+u5n8WdQMjSo3MqCjOD4=;
        b=UrsDiu737ZIJz2Hv6XqGE83vYMwrmtTbem1n/SORUKsaALXBmuav9r5pa8R7ZZ7Udd
         K/G9QRvyBbxmk7wN532GVf7kUOpSeKWNA/MxJliuMge5QtHkCX+zh8n0TJqyVUeB4ycn
         1Pe7bOFWwuUofk/XB5eJzP21m/v3A+Ya+QpMopWwmvYPpTye4PShPsWMF4hRGnL3nall
         9qs8rNsrb/WfxmHvLDxt99Lpr5+lQgCNIDj5lUJPqV2/TpU3GmZgyaTtUNw6qRJ9K/Mw
         vDeNSpMZfsTixOW1zcilvNsQgts7gxx/QbMZNtbj/z1Fc8Thz3CkkPKKa4aDoA36fF+3
         9vfg==
X-Gm-Message-State: AOJu0YwY4Yw1Z6mJQ/ZmwtUlSxtGeo9k+VsG/pX6mC6ngGwMQmjqTTrJ
	h2JHPDXJ96gNFhXhVqkUSekGsWIXezeLk5QshMAbXXGlOkI/Yl96dWqKxutZzcjAXHo=
X-Gm-Gg: ASbGncsXv1Ol0nFMzY0aOCysuKDU2vUYBosBl2QueMSPXTxnnhqhZFgdt/Aynhy2HCR
	AzT60Aqw/S1mk1AjccCQCL3/CF+qN9zrqKvYlh0OqsNP6L1mWEQSE+rUhksyTE2yc8WCg2w4C6a
	vHrAc250DfGRx/R/9gP3WggxfCl3MoIC+UtXqTvmV2r24Xa4mcdVrg+aLJfT2rzI9Gdv/+XsuAC
	kHAEOa4K9NP1l1l6Mc8v3qV1rg6ql227x0XYBOW3W85crzmivKm/NtNYi0vvzitGJxIeHFd2OFn
	2ZrRijYhfa+XGxHtA6Bxsx5iy1MG67iCx+8Iv1lGuhSdqx8h2KC42YL8y0OLKGUln0FUF/qhCVJ
	Mdf9FEseUNfS9XOh0s2Biyg==
X-Google-Smtp-Source: AGHT+IFIAZ3xN3lBOUdVDsCnITitJwKIekhu6IxdSykuDIhyQqEqdpRtwikxYK9cZ+bO9kUDqlBOaA==
X-Received: by 2002:a05:651c:a0b:b0:32d:fd8c:7e76 with SMTP id 38308e7fff4ca-32e9cd23b94mr2248671fa.7.1751633384516;
        Fri, 04 Jul 2025 05:49:44 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-32e1b142f4fsm1875561fa.88.2025.07.04.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:49:44 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: giometti@enneenne.com
Cc: linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] scsi: iscsi: Fix IDR memory leak in transport exit
Date: Fri,  4 Jul 2025 14:49:34 +0200
Message-ID: <20250704124934.1071745-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing idr_destroy() call in iscsi_transport_exit() to properly free
the iscsi_ep_idr radix tree nodes. Without this, module load/unload cycles
leak 576-byte radix tree node allocations, detectable by kmemleak as:

unreferenced object (size 576):
  backtrace:
    [<ffffffff81234567>] radix_tree_node_alloc+0xa0/0xf0
    [<ffffffff81234568>] idr_get_free+0x128/0x280

The iscsi_ep_idr is initialized via DEFINE_IDR() at line 89 and used
throughout the iSCSI transport layer for endpoint ID management with
proper mutex protection via iscsi_ep_idr_mutex. The fix follows the
documented pattern in lib/idr.c and matches the cleanup approach used
by other drivers.

This leak was discovered through comprehensive module testing with cumulative
kmemleak detection across 10 load/unload iterations per module.

Fixes: 3c6ae371b8a1 ("scsi: iscsi: Release endpoint ID when its freed")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/pps/pps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index 6a02245ea35f..25ed0d44b121 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -456,6 +456,7 @@ static void __exit pps_exit(void)
 {
 	class_destroy(pps_class);
 	__unregister_chrdev(pps_major, 0, PPS_MAX_SOURCES, "pps");
+	idr_destroy(&pps_idr);
 }
 
 static int __init pps_init(void)
-- 
2.47.2

