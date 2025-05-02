Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B7224237
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170519; cv=none; b=hV08jKpep3xM9xcFtGqb6R5Ih9ayD/d/ecq4/WoX74sHfKxgYg/cNB1oAT5GysexlZkQa0Y1URChunnXKU80F54+PRB4JWqe3O/gR3/LF+Jnfy99Km/PNVgNCBBd2Fc/38KiFS7AGQ2ETjtZwafSGX519vW+BmHq2sIqxP4g+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170519; c=relaxed/simple;
	bh=EnC5cdHF3TbsKUEY55JwJp8080ea0nqVvuu+9SIRm84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2Xzac3MSD83mY+wSzHOzozmaP2ng47WuwPuRoMwVzdf7ovu6e2fn6pTb6wb18+YB97KLVVHNZxlCaC3UC1eHD1pTYRSO1T/lB77+aj5C7Nmqpm4z1yEQMSEDImZR0fhisTMdQPazKEP8jg3pCfa5mnTN9RPCKCN9I+Hf1RPj9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrjBkCFa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrjBkCFa"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acbb48bad09so299321266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746170516; x=1746775316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=VrjBkCFaCpU4qbeZOxj/zk718xtJJlnX9+rl9tbqMpZ86TTbkkla2UCpPmtYRsbR73
         m57vjjrJjp1SuENLZrJ+7ypGFxmi42aJO1JvYBXqn+UkWQxMUX3esdENeCpU69gmr4+3
         o4D56fByy6md9DJkkLHPkd9RmT3TtZVgxpPDggi8YMOjPqRP3wpXPiIwsta50HqVLvLV
         VQQ7q0hosuZgsAsQh9MhA9Z2HAV4odBA2uTGWK7K0JDNixgGMayWn18Mn5QAtztzh7AC
         38YAKWtZTEc81Iddp/UgsufkZn8RV35LKaa63Gn7tdIk6fhWgq+LWt/EJT9k1zLyVIo6
         qt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170516; x=1746775316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mszv+1TRrfEJqnlN0+/XQLFyntyzjNo5JYomyINlSm0=;
        b=K5iiSAAp/NQQbYR3qo6jFUbMgS0kemIJ3p+wHvzdqil1wa/EZ8k0l07qcMH/+bZCT8
         H7CZHYP/9syeZhMEDBzDk7TsxBPXfBBNjimcOeObWUG9Qlk+ZWdSLUrUYrckRVBqvDY2
         LlJ4GrZv4y70YqjVLnCPwB0p2Nzb2iaQj70s/4GAb2X8nYTqbdgFVH2N+qK88Jn/Eta0
         QMobObVz6Uyt22vKlKBJ3YDbx14+yWxSvfriFsBkqvnxYSCgQFrgX1RhD7O+SreEN3T5
         DL/cMZZ3CeZNA0J1DMYxuc0BpD5yWGLtGYa4XKEARG+phH4pNUjkA+FIzSoS3M6tlFdx
         qzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCF5W8ITMA7bsIDE097Iz8KgAqp7WN0bXayIwistzhWW2ix1whT9iMhbNrO98WSEVvHSqWUbyJA60Ky9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5fJvtpIL8ZdysHT4CRBZK7OAJv7VlydWtp/wjG54NWQglsG4
	tvZSlMaR/aPVKRc6zz8PEo0o/1C97jL99MjuOI75Hxqca3yFypaM
X-Gm-Gg: ASbGncvJT0KrVCdS02l7gSNSohgMEUXt/RFK6K+Damy/Noyv0qIPPYubQszUHF5mjIZ
	/NtVoSfoDI1+G3XTcWNyko3Dx4D4U2f4vy+4nLLlZF5ep+fBVPd4RuQXg8MoDMfcpXbHqPXj9zD
	y0grDdldozrrQigoenfiW/kqSoI4+C7hZEK9Za13bTlbuU78T8jdpOzsqY7NjhOnsJ2VGjn+MNF
	vY+2n8GQlp09dF31GWfVRajFM5hiVAr2fU9lZaWhxWbinJdrHdKM0rbj+ZUwekzS78h/NuhKi23
	wtXiekxBm0yzfRtvorbQpzE8djxvi32XvMrpoFnaZOUo6gwPTAE=
X-Google-Smtp-Source: AGHT+IFfSDV5JbZRPD0lYdfO+LoK4oVGXJrm/3LHFpLnHgTFW21f2kJ1S2E81vtNzM+ZyL3RiGwMkw==
X-Received: by 2002:a17:906:6a2a:b0:ace:cb59:6c47 with SMTP id a640c23a62f3a-ad17ad88ddfmr202128066b.25.1746170516018;
        Fri, 02 May 2025 00:21:56 -0700 (PDT)
Received: from localhost.localdomain ([178.25.124.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c6bsm5691966b.82.2025.05.02.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:21:55 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/3 V2] staging: gpib: Fix PCMCIA config identifier
Date: Fri,  2 May 2025 09:21:48 +0200
Message-ID: <20250502072150.32714-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502072150.32714-1-dpenkler@gmail.com>
References: <20250502072150.32714-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCMCIA config identifier in the ines_exit_module function
was never changed because it was misspelled in the original commit.

Update the config parameter to use the correct identifier from
gpib/Kconfig

Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 49947ac30feb..5168811ee850 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1487,7 +1487,7 @@ static void __exit ines_exit_module(void)
 	gpib_unregister_driver(&ines_pci_unaccel_interface);
 	gpib_unregister_driver(&ines_pci_accel_interface);
 	gpib_unregister_driver(&ines_isa_interface);
-#ifdef GPIB__PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ines_pcmcia_interface);
 	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
-- 
2.49.0

