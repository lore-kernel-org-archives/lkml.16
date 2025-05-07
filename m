Received: from sonic316-54.consmr.mail.gq1.yahoo.com (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8428728E56F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746646545; cv=none; b=Hm6aBgHWeHW7XdlmwjsAKGuoeTXBvuAaJPS/7BO9v86ypb7HeRQQOoJGkl0QfuGjfj7YKibAJ+ubJU+OuA1h59nG+Fp/ZS1crct631KGSzKuJ292wxblN0zwMj2LPmHYDKk9PVn6ZA+SwMO5NfczdjAGjZIGnEh79IADtdCi8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746646545; c=relaxed/simple;
	bh=/ibJ+ZdIq4NSJpcnXBtJz4+mTK5QylfZENGb9T8Fi8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=aROPB9xPxwot6Of5m5ZMg/hovXqJd+Lnhqqs6IsnWzWoPzP09U/5CJpc+oOGnOCXpyWXsHGgxYDfhjU1fxkiBDDFg1NtW1KGtuEWGCgVgvOS9569fMfJ0BlQeLjehco0pPvxeOrr3nG9pmOgVLxcS9ux7G5fna2HRGLjAfbnI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=WBhdGvGO; arc=none smtp.client-ip=98.137.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="WBhdGvGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1746646543; bh=lmga7zKv8+wZUarLSSX0s6Q7CJ3U6AGRqKJhtN6JNfo=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=WBhdGvGOpFqNNissheUddh7dNq7WIdjxGB7lKqcf4wD0EzHOYIV7FnAjQZNG6T14onTZGi/CajL20ftR4aMJMq/4yMGtAywTfnfmritIAAwfLbJO5NmvBNQQglzyV7vYv0VMVwBcdgijrExf62lkpzrWpBmzx/LmLsL3GTnBbthp19xfqD40QVBJweeqygCgzZOiFb4D1c3Q0dgQvPyDlzzoA3dZigpIOv+vhHmxQItxhPRsBMkbPzybo+UDCFdqMnl3TDWGmV2Crl8Trdw/eZy0TPrvcDJ6joJGiGvGiso9zqCoaJbzFcVitCF3B0ROdtdMcISoY0V1XjvMcjeZbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746646543; bh=+FUTSJKU36OlC5KtC8XxzrJw3knNe9t88rza3HeSRck=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ITt/M1onpNikuhDgeuQRI76KCmrlWlRQOS22outWcPhX4A7Bml0+dZN4/xDVPk2ZqJvnhUHbEKMzR/uPv2iibnGOEHSJUXn8njzITj/6bScqYbohwJWWUhXxRBW+IL0678l0o839GyevsOEuyQxio+l3zxIlXFGZOqEAP9febIej5M14Paf2+nckRyfAXuOMy8pqXj5CJi5hFMsriNeI+5Woo8/Zw9ei3DUNr2AEgOb+tM6ab4UWpCyYqUJoI6RfEmVx61cx27SQJ9dp0y48kOWTwLvz0682uBUisYzMonR9zwaRcMAZajXQs8otrZNIU/qBL0PG495/LoCTyNKW4g==
X-YMail-OSG: r98ej.sVM1k38Qf03FFb9in0YlqEhRuo.SbCZAqOGUf7tmKaSlBz1niZj03gNAR
 rF68RuvP7P_Tfj2mtJLpxtCOxri75414SU26i39Sv908k14MOCt7AVgBBat95S2lEje.TYGpakCk
 Ta_pn6jPMCYikra9TeyKMAXunfqOvA7mBJNkcjR_TuJTVHePehMhL2HeidqoVapc45fdaQQzu0Ui
 VUpLak8.ysBvm0U3u9Wbbc8WrnCaBtJwY_I4.3aH_PzktrVzZ7JlCH4aH1UIWEn45SvLRudHYth1
 T3abILqb1LbFNHyUVU.ZnZvNoIKE1Neu2bicy7jxWyCbqftYLcCPuGa41R.1U3ZAZBhWMCwLIga8
 .lF1BE_He_sBaRA8E4tfPacEIiXyFnzTqNcjmGy8akNl56FJNLTcQn2Bk1CdRMTZYUH7.rU1QJs.
 k6CQhF.ikJE9cWBi6WmxymDHSJwoi1YY1NSmGll7tR.unxToqvkW_5MCwOnQx6.xDPPLqHEPdkac
 md6hOM4nQRnXbuEXwtT7zuzHyx3FCuC44wOmqc63XNoWaMNPyyFUSPtahLNQJo4N.U6mxTgDFD1F
 fRpHxBvuHTZr8E17CnIBJNAm0LRzl.5HDJkWCGZpPdLxPxerKhGL4gZpsjtW24SzvEeXjqalfbRJ
 X.cXfIu55yxce11YGUI7Y3qyIcry5a.Bsv9hslYQiruVS6b0hl4gyhu4k4cMutfHp3TO0I3v7Mbu
 yVd3_c3CLyLVfkQ5SpOnEcSx5irHkrn0Gw5LI_S36Grq9IMXee5s58HTLfu40xFj1udrwVT3RdVK
 6ehddzN0arB94MxYmNSUllTK9q9_YfBPHUecMt80WGBwU.OhSoyN7OEOjPbtQ2Kp_uMXou9ltgX0
 2e4HTh.bPszDmnQuJXWF9MbabHLHD8lkmTemsWEDqqT5murniYF8_ezU0HWYu9AEqMxLJTRZEQQK
 RFCBsGmInqzmu_MIWi.pAS_YL52wpXRx7PIQ91vtJ1LOz8pTL37TdUw.tRunhvhlBF1FHLSPzdE6
 7GVehiqutA7_sqEmX.AsHJjfhTnQQod6Y4JruH4feAxfu491pxbOfrvWRmwmT_JzeRQdMHR9B3sW
 1RHycUbZ5cdPtST6KGA.9GW09Dre0GI8K.rczUZy5_hcOjESVmo_KOe24UE8ztfWZzyuM33zS_z3
 BVppYdKag2wAByslR.hsz6Z7mNhX9TFACVVBxgukQqjQKxDH9ix2YKVm_YQwPQID17IagODf9L64
 UNRUh_uB9gbki_H_FKRvxxE3oc9pLd_9hDuP0zlxxk.fguvXF9JGLM19tiCv79Fk7S476lGwvtUp
 eKxnAshQb.i3ebdfAjBAn2PXmg5sw8tLk5IJ9VV49Dbh9AVQQN.i0y3.yJ1m6fn93RAsL6uPhGk6
 dChiuazrvm3teCNUqQUqKyG6F_leQ8Wx56ivQEgLiNFzpTWeGJRhmZ52sb1AoCiqMe4uHJ1AXAES
 jupJFGn1BoaWqbTcLZ6JFkeFSp.64sxXR.yINFQnvmP5IiuBWXo2dudOtLIM4F5dxe38uhrGM9yJ
 QxxJybzyHSCLQJtpo.Ry8v_dhFozoa2d1DHXw9AjLCNcGMADiysM8TmgpK4BwzA7QJaItQ3Cb9w_
 ZudOGD6M5SsfeSeblD5_PX6kptJnwNQdaKJ0uifi_WTu8KeFyBanWTHuztXTIZJe4Ou_vMyi4JR_
 AX1HCpHUVy1I3338qBQI1dHPVLP.2eb3S3ERHSQaZEEwAlpdrjmWXD6RFyKquBIU4WFVxje4ksCo
 Glk7Wx6QQ15AHnlPFb3LZrvansBFALRdfNqYd3Cj9EYxW.5vPn_I._HMu2PSB2xmwEUTZI5S7efz
 bFl.OzTHl_5U_hImmImE4WqM4sbPEFlVZ7ucuyif5rrujZo5h034QDGp.D1ujflzpUsk4_ox5x82
 Po9rP1VBMcNqK6r5YsDP2k6xx6bWWXcUcpTpsLi4y4_2iSToVggiq4sLs5EvFJ1qjlstU7.SUMfw
 boM49TstsyHp1ggknVnKi.CRXFJwd_WXs6yLaYlntpSyUBGmp83bRH8M4.PUiLUB8JNHpRDdW06R
 6TMRn39tnM9mKjzsgTqgMhhOvz_bgJTpTg1wngix9zJUi7CHBC6MWF8NdxHlmhWnFxuo8xkVbFrE
 tjQk8j9Hxyoz.78O_1PcpvD3CSrs1ekv8LPqVZFopylcViYf_H_mZwJHsQVzDPKsl61N5NJs_x3B
 2FSCqQxFUCa8XsR4pxzZgOb8ul2KCMqouT82Hz8JZOyuEUhm6nEf8jGxVP1cgm94Z
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 5588d6e7-8905-487b-99f4-71023ca18f2b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 7 May 2025 19:35:43 +0000
Received: by hermes--production-ir2-858bd4ff7b-mp79t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0ce168842b6194365513fec4b9b0872e;
          Wed, 07 May 2025 18:55:10 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Ruben Wauters <rubenru09@aol.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/cpu/intel: replace deprecated strcpy with strscpy
Date: Wed,  7 May 2025 19:51:36 +0100
Message-ID: <20250507185459.8769-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250507185459.8769-1-rubenru09.ref@aol.com>

strcpy is deprecated due to lack of bounds checking.
This patch replaces strcpy with strscpy, the recommended alternative for
null terminated strings, to follow best practices.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 584dd55bf739..b49bba30434d 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
 		}
 
 		if (p)
-			strcpy(c->x86_model_id, p);
+			strscpy(c->x86_model_id, p);
 	}
 #endif
 
-- 
2.48.1

