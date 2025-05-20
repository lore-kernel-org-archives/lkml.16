Received: from sonic316-54.consmr.mail.gq1.yahoo.com (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA82F37
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749983; cv=none; b=fpfrNgeSYWw2mnPRHk3G2eRsgL7LvjTik5v2iJR+cZvBB6JAGRXMwd8oiYZq3i1RJieSl9VKjMH3iK3XT3E7Tz44ixSTW+LVwSGZZ4YAXLhaQ5tlA2o10PsBXEc4T8eJQIajOxET570LzEFOakV2kIWpmlpIgmYmvWQQo9NwNyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749983; c=relaxed/simple;
	bh=ftdPYQz5JdJkSIoGv/W1oKf2Bk4O8xewbHpR31XM8gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=Byoahu2ZU7k0nyVjlcZu4oTPp9xFEI2vca79c1L8mXRHLb1GlazljtuTrHKX/1ZYUv7iKWEPkAhRfWGtzWB9hkV7+8MPAV773NdBPFEcttyykIcsbRMaDhZKJVB+L2mZMCg5FRs3FXi4kHGtLatS4yBbV1jtece030DukXUC5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=qlDhOQyS; arc=none smtp.client-ip=98.137.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="qlDhOQyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1747749981; bh=4a0TfG+LXuLArFy6Q4kD2q2dE42hTdyoT4Gboddiyjo=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=qlDhOQySENdxSBtz78YjCJMEf+6/TTPzMq3b2cp1I7mnMlVKcP7by9TPEMDJ7IwBngL2LUhuzNFaOd59tSloVWzFaEC2EVIugC1GoGk7jLzAgNyABqKO0GYyKSPV06nung0IQp2VTjByWSs/1dp/GVOdCAhB0ZZTy740Cr23VeIXz78R0xLcyMx4xu1fMFOO9SHOxegZOyfp8+6dIaF9S0h0vuAfltuZX5OFOnRr5o+f+giG2DOwD4Q3dAX39TxQlqcAb0jnFMB7NRHo3rlDtTH0a8SHnx8WKOvQ4kRZunCNXZNaVp1PToIMKv5C1e18j9j3IrMIcJ0yEB2ZuN7xaQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747749981; bh=rdumxaNSTT45x6kfpFJJ2IXEFq9Y0hlh5DNP9HF8Am6=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Y7lkXUPm3yDyzy22bE3NJk0rTranSGJ/AfPugHXAdQSCBLj7Cr6OZoVAvfX7o8NVy+F19ILkTChkh+caDSq9OwrBgP3qNcJ+CV9laRalHZMMAHJYR57kxXy9+NP4KEXb5aUUh7qSkeuxe8Mewms3GVkgpJg/CF+H/zSHDp9hXu7Xgyhjaxj9ITaKd/QVe3rrtRv/B13FNgw+nZQtNFCtVWcR2zfG/ZMYjpUdzTrB+mCLP/GVVc8fVTJ8h5NDWfD6kntCIxkN5o3i79UCthYvQfkW3ygh/R/fJYVxPuW7QGwGS3RoL/9ThePO06LIAVXpakF8U8kyQZ1O4pt50rHRtg==
X-YMail-OSG: 9fZvFjgVM1kLTMdmCvtR5rOLUo650Ybk9sAdVsD1P0w4HzrGPmwQU0.2cPMwUk4
 Y6vjtyWoDlugIP6vZr5bMx656t7ioUBVoAt3ppEbkBLxtGbMG.0DEmQaMKrn6shmygPoqwohEyQm
 yV_3nxQpqwOY2nd09DT2vYK_lzq4Ye.aC8Oqy1Tsigi8D7N0QFGt4JzYyrZWRtxF3tjnGfO3mE3X
 6fal0yN755Uly_He25XltW2kMcPxanLxwsPErfFUUK7L7qojkUroQ2bOtEO5ZAj1yOgjcKozI70e
 jPCNLi.VEmtFSeFRf.VgwxKlHgdOFaXlshgY.RvvUpa1gnkjrmMld9OW.VM1kcUr3ZYRqzu7RlfB
 hKiWLF6cecusUmQdoNmsY.oTvF_Bu9SMgH2cC6XUWsXV96QlK0uxJ2VL3V0U6YVqhQ31u044cks7
 vNBXFPu5pFmMSoH7D14YMkXROnKmTdHKftfpLxJ7uVn_kXJevOSsGGldDIzhkMXk.9.8W55Nc2GY
 _9X0840cISyOP2X.xtZD8tDdpihDVl_8inIUNfLLsXtwui19.ebpihEO8MK_10h9zKrdX9XHhUVE
 1DYPzIDIbatqoZj5FPVtaFTOzqjY2dlk4IZGs19xJ1pDN2B9EkgPnF3wdqbHcaLNMnCXo5VNJM5h
 O9ebY1gA34NOD5aZOAtXh8ILYPlBj3kPX_IOY5ZOJWVBdGvYKKs4Soor75E.qNKu.ak..ijI6Vlg
 V1hzTgJRcHM8XP07yPNrEmM7fJtqTlJLl8iLJBB9mWoluumAN3Y5oYSVKSBV.A7Y3a5OUw0c0JGz
 15hAiXBP_G1NwcXbKWDUgeAJKht5yUXXuqwXtdbssPuUVYjVfPxHv6AP51zuNWSCD4Qbcz37wYZK
 n2nbWwuFyL6PquqggIHA41uJ91BlswSb.uS7wVw3sQ6mXEyQVj7TAp2wMoUOUFFFrD6e6EGW0hk3
 I72b1HaR8I8G1K8WAw1O0mC.5E9GryeMBbJNljQq4gsv6JvYVvu3UFc3v32CF6R1lR0dgib8gh8b
 AfTomJXPjsV1_s4z3HfinvRWzuyeFbj6TxXLnTRuCZuxDpqkiF7Z0.76ni81fh6loiYboNM2hk4s
 ogGeiRNRnAYh98hxQeR3avPTQUh5fqs1yhyff.o5sMDOIi6mT3hOuFNVBqVYaFdEHII0FEHn_nNW
 uZ9fAMVh_Hmu8lzBrkaYQ9hUof0RDFPZCsFZyuSlK5.oScOk4l5KfQItjn2yZnewZw.95A02JLxo
 iScb44dhDkomOi7OoMX3Qa0zL6KVhls9UyacwqhB1CYcb3FldWNvEPsf.dUZ0vQptz4GoszLwcdu
 j5nM4vCmwUDTKaval3x6IkBgCNaPzC6kpZflKzdphSyKYECieGu0KpIDlSjR3JL7Co_pUF5bcsCm
 TyGmLjoizTWDVtqwWCB.i98c95U_Y3nxowZqWWY0xEFDMeDNiz0kYqrnuxODNRUP73t05Af_wpoN
 xQnDZ3p1yNG7ZFAG5Gz1HartHHU3WTvCGrgFNka1nXb7Lg.vHdaHkmSwupHp.xrB0kr.JEqlsjaC
 a15NXiu34BDFZzYwnoW4y4n8Ie4hYXzateaEKQ1hI3YRFCLmE2LrBAOcoz_3wn8oNYS.mz7TZ3W6
 y_SBLkKZ9ciul_XBLDJA.TQL1EKFsCtC.A3Ozpyvuy4Y0V9u0ZH_L5ZzCza715Bk_5hVoBZastyP
 d2skKOQZ4LtO4F376Br4U35cTT1lztstrw0K6oYNZzW4FckGv2A7rw8q.icJlPTR1c14HbNGIVP9
 ZUWBnssbxqHkzYgoc4bfrHsj5rR8W5for9b1b7lv3IJoya5UnRcx5QXd4J49uCbsOmiiJHgAdRgi
 E_Q4bTTrp7EMbrhXndF_dJIbJORXueHXtLf6dd5yNy6hCJRoqvnBb39O8exZ4rEGEh5jxUgFRrlB
 gFH58VXLv22zgKgbkslEHzNl67FN9c31PmCxSa9f25i2vlFie5DyCISl4Rh.hDcNq7cbvRDCAbRc
 5wv7KEWvuipKn6K.m4WeImJ6kOpedZmML9Nlsz.9X7PNBfn3OOFni_k3Eb0EtlPzcN8prxRX3jmy
 1fc1NiCQfPC8DecVCfZ8iuJa_NLZyQKFlICkUTshSDm6UXrqRomlZJRKjZRlnU._AmaGlL.JcpY6
 Jg6RF_lmrS0HO59dB._u36XX4fhRntuKekmpQxP5b4llLFF6xdKtlIEhGZvwYDGs4ihaa8Ed5h5m
 Q7V7Eut_1Mnu4hq7cCspBeNoUghWDnfZwlI1HaDgeiSmBFPnodehaFJ99NJMTYA--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 9d97dba5-b181-472c-95ab-da07de3feff3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 20 May 2025 14:06:21 +0000
Received: by hermes--production-ir2-858bd4ff7b-v2qb6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID fd6f2ea515adda635aada45a78b404a9;
          Tue, 20 May 2025 13:35:56 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Ruben Wauters <rubenru09@aol.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] x86/cpu/intel: replace deprecated strcpy with strscpy
Date: Tue, 20 May 2025 14:26:37 +0100
Message-ID: <20250520133549.9964-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250520133549.9964-1-rubenru09.ref@aol.com>

strcpy is deprecated due to lack of bounds checking.
This patch replaces strcpy with strscpy, the recommended alternative for
null terminated strings, to follow best practices.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
This patch was reviewed by H. Peter Anvin and (by my understanding)
was deemed ok to apply. However this patch has not been applied after 2
weeks, so I am resending it. I have not added a Reviewed-by tag as H.
Peter Anvin did not do so.

I also wanted to note that while immediately this may not have any
effect, any addition or changes to the strings above may possibly
overflow the fixed buffer of 64, and the use of strscpy instead of
strcpy will help prevent any buffer overflows by copying a max amount of
bytes. I do also recognise however that the strings above are unlikely
to be added to, as (by my understanding) they'd require intel to release
a CPU where the x86_model_id would not be detectable.

I still believe that while the above scenerio may not come to pass, the
replacement of a deprecated API with the preferred alternative is good
practice and should be done.
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

