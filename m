Received: from sonic315-55.consmr.mail.gq1.yahoo.com (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E5826C3A7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969269; cv=none; b=YUI3HzKKRmvgf6BxV2nasSOBQi6/IGYChTEVSsbavhF0/5k1RWsrMflbwaOaLAvc35AJWqgVu9ZUCAhR2v1B6/GAs6H8+MJ7M7qOu/oHx1Jy++JG/woBh5mOzkS0j6dXvAd3ZQB4ptoOaWRSOI+4PKKQ8bJapjc/Sp0/nijk7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969269; c=relaxed/simple;
	bh=sFBNCy9z9muzy6OhI8yB0F3qil0Q+xdlTlNWoXxq9pM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=e+kASaDwz/Vx7EIIN76KuAH+Ny9v50YDJSRaY7gD2qCSlrCYluDVMQDYZ3hqka4/nrhlYY29qnfXtD7r9zbgncMZpR2aglKII6x1i7Guxf73kIYfLqMcwgNOVQEnssRK2YvAlVf5m1ef7VFc4Ly+cZmFvN/biBILCiYAtgbtMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=Ugm7iWVf; arc=none smtp.client-ip=98.137.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="Ugm7iWVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1745969261; bh=emx91ZQiV4dAWiUpLmrlXmVyrQJzAqT2QW5vSV4K2CM=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Ugm7iWVf/XnKmUZftUNBSIlwMd6hhkxYYOD1NBvddpcTbrcBX9XUZPCtVn3dmv7gkaSvi9SiWj0bi6HAtkoZVdZykUYWj+UeFhl/+/3zopT01LYaqndYTISdzWX8P3sky1aAZOsuy4gfRneangOwWrM4dQHK5K/6464nsqx7WE+J98kR531g/HJU4hA/dqMmpiCuZ+wc4vnVmRJIUG9BVFJ3OLcEB6vBkEt7TWkAJxj1Ho2GZwr0ETcoU4R6SPuMH0WjcalnFSKMrFip1A5uapnQHe09NNn1CDsNhTloE5aI1JjU5TnPE1KY0HEUlW6mChYbyqGlVH33p36aZIZkWQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745969261; bh=zSiwtPiEM8CgN+YRXZ1MtQGYBQW0Nn6FTErn79+qfTY=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cxBv1cdvpABwCnBWJcOD4NTBOjvkY7u4ynvLsyiyDGpfYgH6FPilI2fWxZvMNPpUs3+Rhi0qWfVzJN+mDi/0eRa8TttWltADd0zp1ediDOBHQD7j5bABxVAbLryYdBQDXutAaM2oQAAnCvWVps28OBMClJkGU6ASQMeNbcYD2qAKWwm8aCmqsnRo8DCHF3/svZdzNhM/FtBeDbaqYxnTVTsXSNV9s5WVaA//0EiMMIQcB1S7ahjdSIAv2ZR/Mi6p0ZU+qaaQSWo5prV2xI4zwkPnn8PFeWe0TgckFpZQpaWWjNsYmRrSRq8NRd9GDsSndIvm3VUWCdSmDeOUVYXfFg==
X-YMail-OSG: pjCZUsUVM1mmRG7osglAnyVO8T9xYFlWi2evKcY.ZlkTDslS7cRxhtwIbpyIn9s
 aTI3PJ6YSg9xxfQAMmXT.SxsJHANxWHleTv.ZdDEBpUBIq52ixCzvoE95HRYbdyLxso4DVSBUNv3
 q5Lt8bHBazxOQGH0Gmr2qQ3xWOMNmEjPWGaVvtggSiK4VDs4wQukSIgNknlIIWBpBvg.hjYnS_m9
 nsQQgv1KVtksvh2PnDuFmwA6WKvcWxCVyzUoNGhTKiKfBwDXy4ahg3dPAAOM2_BQCpgjZzz.8hk6
 I62Vg2HyZzo4GjbrcxPj.UdmHgbh3zaVgyEolSmJtUuwMYWqdDwexpIrk4UcvFZgqaTKESbtqv05
 GRps.4phD20mRYCTDZ5UJ7lV7seYCs9Oq97WJqxozs1WNjH.FZaRXMLsqscrP8PotWPvdRYcnlgK
 Ob8na5BDLD1oJlhRgIanwouynO1UarPzmMDe9C1ZXBpnLSWqQj7FaV_5gyqtpEnS9CEe4Z3remsq
 9.p47OvgxkLQhnlVt9JVJFaCQFUWBLp1rZ9OGECFAv80u9B5vc3PmZvSpDz_ScODpPgGFK7J0SAw
 0FELlYUwkv7K_kKXaSrSKNUKwLmRw6ULbVrg6WaTnm1rmwdjJ5aogmpH0yv7uktOyvV6rPtM_Rt.
 CU5.OVnJp518O.jjLHnGYcjRKOvsb609wutstqFOAnNWC7SYNeUeAY5NEvA0DNWkgQLUCaphGHPO
 xeEFgP5N_l7G4FlvSDMOJsLx2f3IpDXgX90JoeKSJlPQyM.uX4FCOpfVh4wpU7m4nI.Nyin9DgzT
 3jwDuEgm.e1GfWyK4VJ4dxQRWD.afAml80zqMFh_AAZ7GLWeNn97Qpa2mwglxy..xZKGikC.uL3J
 piwNw3HTOFdLP5Qds7YLERBfudRCEGycrBr0ly0V1VDhnXvIIQniEpFkcoM2vcOpJbA.PxlWDfF4
 x_2lxjbRLFLG2XiFqZXYWLXgkJ_F2LLZzuXBhWCdpennTvjUjarb3Gr3IzIi0PaomEvFnN3V3.xd
 15mnOW.qlBI6yqHA6KqcAmaSd3xtX1Jqv4ms8kNllLuhpXTAAQP5iPk7E5htxKzRgc24A85CQzaW
 aVnNZPafwbGQL1hEKKfUuS3OlOxXSldjarIuKK2EEF9PlMRgsCRlj3SkNTHuzbwfQe8YM5l8oA41
 PYUTWnXf7IyIJEqNTQSUXhTxF3dnBgM4urAgxSSGaJLHIvckbN6w2SzTgSEUrlBHurpt1qJHYUqv
 dDDMSr9veVf6anN0HkW5iUCCxfL5oQ8H7msA7C8ihyEl.XfAF8euxpXtuVIz2k9rQ_3SxlmaRPZE
 qnH.FaWgMh8UbBn4Z89Fve9ee2QMSPV7Iajolb7YvR0wBUU4dwPKofgdbow2zeg9NNuhsdQ1vVMW
 eb9QIJzWPNvNfQESUi71aUGu.u4eqyAQr_NwSRX7cQZYieeKLkzZmejlwHz1zydWYBynWmYb15Mq
 t9ggou1nUz__aJa3VktE1juW98n4Av3E0pWfNxxliMdIPhPLgzdccWzn783diaB1SnSQ9aK.NmpV
 AoZFBej.iiMehz_.J7LhpngtDdmkGFMgzvE7E3rdDRGeD4K6286QIAyUd1z9lZsM8jeVxLZetd0c
 Y8Lei69w8gAkwAgHXw6d7e9za5cPMugbobD9mD0dr1BNSvwOl6b.mEFyDyKKC0DQmXz6dfyRVtuo
 KM48_LCsaiRVPLVz.aCQFREF6atMxrdzGKf9oPdhpIclNRAaNAH6NuCZ_zRAw.N9nzYPhVNBnleN
 sqIkXBQy0xJzLxzS7Xtjk6ZprrQeEX7RD4_sbKV1AmxZMUSS_vMEP2MKsA84rJQUxDzcx2TIGgh.
 31YuiKx0RXYw1__UQJfXrcVdnCNqwAlykAS1IUQexNxSfqklJBbnmsgCZYhnunVB7UVqZ.bLQycY
 9Y0nXK2vquPrch3rTppEGEQ3mfF5E57eIEJP9Vy.9rrgax.dtsbgEKpS.Ctf9mc5bnkpcTPzEqtU
 GOR1ad2quPyhz..5HWqj68_iG5RtzfG2a8xOd8auWgfwcIgOPNBZSdl9g_iRE9Tpq6g.nXMUWmDh
 fy_.QQyvHAMNd7b5KDbSW5r2v27obbtJ3o4z66RBabK2ps2KD.hvB7Sh.ZYn9tSv8jRXLKBhUtj9
 8p.vpZHe.UXGhi8BQrzis9yI5EWAF2dDx1nGrLAyivIEiM87AXife0iiuhYAQKMKZ9BvkRR8VF4_
 A4F_u0m2I_8Gf_e2YT_S7OY9uc8TJToK9maYLYziQeyI43UU73cniun75vBJHplu8lERctQPS
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: a4333197-3717-43d7-9df5-623143b9edae
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.gq1.yahoo.com with HTTP; Tue, 29 Apr 2025 23:27:41 +0000
Received: by hermes--production-ir2-858bd4ff7b-vm54s (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69d7b9f68847b859787e0cd3e413d376;
          Tue, 29 Apr 2025 23:07:22 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Ruben Wauters <rubenru09@aol.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/cpu/amd: replace strcpy with strscpy
Date: Wed, 30 Apr 2025 00:03:59 +0100
Message-ID: <20250429230710.54014-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250429230710.54014-1-rubenru09.ref@aol.com>

strcpy is deprecated due to issues with bounds checking and overflows
this patch replaces strcpy with the preferred strscpy

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 arch/x86/kernel/cpu/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 1f7925e45b46..32c78784f96e 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -643,7 +643,7 @@ static void init_amd_k8(struct cpuinfo_x86 *c)
 	}
 
 	if (!c->x86_model_id[0])
-		strcpy(c->x86_model_id, "Hammer");
+		strscpy(c->x86_model_id, "Hammer");
 
 #ifdef CONFIG_SMP
 	/*
-- 
2.48.1

