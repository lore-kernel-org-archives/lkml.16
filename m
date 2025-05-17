Received: from sonic305-19.consmr.mail.sg3.yahoo.com (sonic305-19.consmr.mail.sg3.yahoo.com [106.10.241.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AB1D61BC
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747475328; cv=none; b=fWviExbDbPzpRKeyF5lQJ7iHo5dHWGhdsl3v9RD1x8x2fXwhcSiNJ4DHPORGHFqf04eLzdbGQcREVd922sPafpNm8vt41FxXvnmYPqh/x0ujg60/zpeP/f4AaP25HiOgIsiIcMfQ03wIkFPl4AAxD5qfQcL+psewr8kmHbxgRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747475328; c=relaxed/simple;
	bh=Yb5Rql7cM+SMAkVBhFFCKxJq3PsJPcbf8EEVtS9Lv6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=miByzAPU+mFHCD0T0JOzdYH14nDMnesrT8acn/dgkmmUhOfJADgg8VTv396nAER71numBxik390TfjaTMwfScENkB9E9V0Cynpk5f4Ow/P2Zi4ROxa7zjQ+DqpLvokMKzHDblIkNlPzXoNcfiZI061hcJmzb6tf8CyHsWrybLng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=LGjZcyrB; arc=none smtp.client-ip=106.10.241.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="LGjZcyrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747475324; bh=QQhY0Sb/OCIv/LJ1TZqQpbqN7VPKZZoSds6JmDCrdfo=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=LGjZcyrBWfLQ5kNWV9aoRNJRRr8Cx4d4OW1jZWby2knYUXkrjwjh0gNmqH9sqo1fEIKG7myJJJQekrPp4v5/qN5lsa2xBXJqZQU5mEmzCoHXB9E7BkCpack8eQx1zC6YMdCHbOR3CxstH85/QqOTW7/ckziB414Un5t5k+f/G8ceJrPdW9VSEyBYThTAiQfweuGd/qgMTtCpbJ6Kk+OGGJ3+6COG9n64P4X1tWEQb7OooUpI/dOHAgvCYW0AFEGF7HL/WtI3k929+OSWkRwZm5beN3IE9/g0LTW6RCSCvCnfQD+xRdOF7nN+PNwsqla75emR14X1A1vy1He1/q2oyA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747475324; bh=j65iqfWO2i37mDIkYNc53Nc9fh6ygdZrFU8BmaZZVQI=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=XeciN6kJ86Lg/3rMVHCq8XJgJocCd/i8V6czkEBdBPLXySdTW8oKGgKhex498IofTxwP/39vWWxSZEGj0hoIjYBjSu5b5A/0lmppAhAdEwGpcDbJPsfpvH6zL7qgDRxUSLTEUNQq3fNnoKDMzrnzdNExE/wC5u08p9UMyprUSs75Cpc7lbCHzfr0NvGWfxAvUvpqm1Q4lp+ROL7+NapSHmkJmiKsihoCM8zJ7VEkoFJgd+QxYkpCFstswFS2crwMsjwRzModbHQLYYZHE5ZDhqMR1mA4ldi/W17pQ2wB9SeUcqeyerpukvTQQdV1vrG/U04fi60oAOBUN3End+Xahw==
X-YMail-OSG: OKp8BpsVM1l0pzz3UjYk8.Ffwyk10z2kB7AA2__rAW.lcxNO0qm5ovPklnoW_Au
 gsd5qiihbQxV9NyAuQ_9NWXbUVHDY3Em9UVDe5XGtBY5YMoGmLKTNipNk5twC4zSWmrYlOBHr4Ih
 o7riF9IK1tq1em0pJ0FUvH5VwwjZgrz.9ofyB31mL2AuARJsyvpej.JvYbAUJV9zVdpC18njxYqy
 MfGQ6A8aTOk9_fuzLST7H3d3E_0TFfpK_mWeUeFl.H_RGk39yBoc2f4fLw8OESuWy3wdW3LIBc3U
 WRbhcw3uwIeSMZxA_MdOCMI7gXT2ROQJFg11XHo8dbGj44X8Ajj17nQt8KJUeFf49Wu49nHlanl1
 jrWAXjzW2gl3fVjamhKt2aDnrf9GI54dlMbiUnPddTGkBFKjgMRrCUzbxZ4elynCn0nDr1J78Y_p
 Zr8rUN5IGTI3IimYyJEV8x8qe__ecjdKl4mtGdij9y4p3DQSbVhbd40UfULTfmksd8Ck9LDscJr5
 XjtQYj_7prKIMzVzK2tqVR5yA5DFKDNlYro4h7pwEfgCpcDgrerm7lZh86mYFfN1a9tCDE0XkqQX
 x55CeRaekHKrVXijVmsLfZU.V17CxfWLsKY8yqdUxmLnOfY8.GxMIvs8nqQPgz97nIc_up_096vW
 4u.q2uXVUO5wryl8rSeGp1o1qOQrjnwAEcFY2t55WUt7Y8r_53pJzzb_acnTdYshYfRMGD2Z.pxY
 VFrCh5p67a26QoDreAL62esXHnxMUQX8VMavA6rBEyw17LVdCNR2e3fztkeoHBq_m51dI1Fo71Dm
 Kyikfd6ZSPfBFlgJQVT7i_8y9bESxEnUq5O2cUwtltHWDSJtN79QY4xlk9uPqt7NjYBVzdyUKQ.C
 mZbtJHgQuNpI1McA_NeQ9GjpDBt96lhNyrT3fphM9MuYktQzfpJlrlQL0ld2eXqXgJx_PF5dNVOZ
 a15S8mExzGSjlIYdW.afN_2V2.emWItAC4lFxfFzGeLcs1naSh0ZRI1DxOkpF50sV81rfVNpUXEC
 UAntd1aqJnzfcAhsDVSsIzUlYcN02_POlFRQPz6_dcQq4jvz5L8HyOSOtZn1.57SQoXUJYKLFyj7
 M2GH4ZeZCqlc9f4JEA1j8HiQp8ID69lNgbq3yFyF5Oktx_2com2VMe7L41ubKOWSvNVUuckIAIQ9
 R90xkp3lN3jtRmL0sw4loxF__w_aBp76rrgacnZxPwM36Tek8trgZX5YX6bT46H6euFlw2jX5yRu
 QwD_m1jJ5Fz7nZt_C4FRE5T6yNQ63V9zgfvCTOJQqzWkBcPLd1vhuX4MyC14SWrZLvtV8ZGG0bmH
 eddKDyti5vN9asEvz04zW0wwU_GdjbwrCqemTG.N6WByQ7ExqP5urNSrEnQ6P06ZPNPM2BGWXtDW
 OmYUjz9OCr3_hwzEP0b2BNzyricG.hkbC4bH8qZxagAfk_8qCAT447ucQKTgR.dopmTf0KxMQkn5
 q0BiXelMgblfmSJtPRpSVRlQVCb_0iYyaLbsjgxOkq2HvInQVyWPmgnWpLqVwfuvQU4NAJRjkNOK
 UMoEeRGXn.4gNvGEI2Kovmw5mvYSke7t3i3z7CVXCoMg.vBsGMPYRx3w7e45YADuILu_fFzLm7K_
 jGKWNYjtzQyy4Cm8z9fmEm0TseFk5xg.sb_x6JBmdG50mKc93oiOVpnQFbawihzO2LHxcR33_nej
 vprScUv541rJfxgT7W32NVjEhjgUvwIj061AKieIJ2zdrj8fgCXRIiJ9bSCA2nwPvueqqAOm7y_1
 gvEyBIe_bMm5SM_tesrh.vFdqta0k_YZLJGSroccL874.URIah.V0cOUZu__CHHATTUt2qdkQdtQ
 is6QAjX38Qjzyy8Y5hSFEa.94IABFBCTzHfsxNCMtFg1HWJGei1_dhkLCYShrmhN48ynf9kOC4Ca
 eGhuh2QonYiTDyqceG8OJGEw1Zdao07l0s3G.mTJ.8D7gFcCilpcoDA_ndYyY8tmb4NMoYUkE1tu
 i53IhTUVjSY8TTfCRt6YJuTGgRJ6KEjAfD7mntG0e2J5PmmXhOTrOX5lLXLvranUObAsAghfqH.C
 FyHQaJlFeLoBIzKE7PLo_dP8gTPSrQCwzN2dMcVCjlEf.i2QCMCKdICsoDT5XLiZGJ2HFsXr_utA
 z88mvNSZMg2m2aymng09LBwyvw3TZr_Ofhx4u7dzXjkycfc_mFM6NbqMBJcBFMZ29BwdX0vWHRFk
 vBicw
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: c31025da-d115-409e-8b76-906fc1b1965c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.sg3.yahoo.com with HTTP; Sat, 17 May 2025 09:48:44 +0000
Received: by hermes--production-gq1-74d64bb7d7-nrjbm (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3bfd33b1abe7a8799d233b982da9b471;
          Sat, 17 May 2025 09:18:17 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: skhan@linuxfoundation.org,
	sumanth.gavini@yahoo.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: Fix "diasble" to "disable"
Date: Sat, 17 May 2025 02:18:10 -0700
Message-ID: <20250517091814.1263768-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517091814.1263768-1-sumanth.gavini.ref@yahoo.com>

 Fix misspelling reported by codespell

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 Documentation/ABI/testing/sysfs-devices-power | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-power b/Documentation/ABI/testing/sysfs-devices-power
index 54195530e97a..d3da88b26a53 100644
--- a/Documentation/ABI/testing/sysfs-devices-power
+++ b/Documentation/ABI/testing/sysfs-devices-power
@@ -56,7 +56,7 @@ Date:		January 2009
 Contact:	Rafael J. Wysocki <rjw@rjwysocki.net>
 Description:
 		The /sys/devices/.../async attribute allows the user space to
-		enable or diasble the device's suspend and resume callbacks to
+		enable or disable the device's suspend and resume callbacks to
 		be executed asynchronously (ie. in separate threads, in parallel
 		with the main suspend/resume thread) during system-wide power
 		transitions (eg. suspend to RAM, hibernation).
-- 
2.43.0

