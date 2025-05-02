Received: from sonic309-25.consmr.mail.ne1.yahoo.com (sonic309-25.consmr.mail.ne1.yahoo.com [66.163.184.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C1FD517
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746232506; cv=none; b=q4YKfqo58yY7kTsOi1oQy44upUS/z/d97rp6yrH1Gi7/0Ngkq7D14JnbQeeVk7dTH+An0JpJIssjivrLolcEl+Le+RdxuLRh0ogkwo8NAFqZ6Mhm5fzvgYFsocwHIgwgtYFkLKcyEdRh4wSpw7jr7QSa5DR9GwlB9LkY+pbVGOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746232506; c=relaxed/simple;
	bh=DRgjTJzfOUkV2FN8Clx2YIudyd0Vpr2RRwStHIwWFqM=;
	h=Date:From:Subject:To:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3kPzmkE9YWK8/yeTw48CZOkmYwfG+T/ZEVG0DLQ1+1tanbgBVFWMdRUAJ7zC6/pE7xl7sYYgAyp/JFwKIL3gzEBHC/X1WoDxekCLjyw9BFZZZQEXNIbsKMH+J3/+xMSB/vwzydvQ8dmMFB9wLT35Ar7zzpIzAfeAftW37yWqgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=pass smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=Bm57NGwm; arc=none smtp.client-ip=66.163.184.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="Bm57NGwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1746232503; bh=Mam8BdTcwg0aP9l5GoKZjYOcIagh4HPoMzui3EjR7HA=; h=Date:From:Subject:To:In-Reply-To:References:From:Subject:Reply-To; b=Bm57NGwmRzZiATBzJG5am/dRhqRWj8CZTl/ACjAXtq8k3PHlpDLeFVKC1yFFVdRaAQIjgx+u0+5ITFoExtZLbW47RXtorhN9JAMMJVmaljKiNe0Q+fL6+AOzQfYEGpmvASkR0kmvg/m5tk9IE279i15yr9hO03zqBFPKCuz4RRw=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746232503; bh=A4PSDN6GtfDxm57k1Brp4i2/tBw+bSSKOzfdcqNqFZc=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=f/4JaO883SorYi0jOm4R6GILCBxj17/AsEa6ugxoNKsdrSBtPqgsCVkm7WfHaG3SrF7fufa1YMUzMinqYSB0gbu/lNkZVrQsW3CXBIZxVEUiIqY4VorQytf9r8Ce1Ul+rpDwpYFIEKbamXZkWyS6SWeNJQo5gdj6KoeCkcBZqcgAAwj4fR2Djr1H+w3JVyrfMPQdMarbFCd51KGYqGLo0AcQPDaxHqPCb/Sys8om19SCyB496w5LK4TBWGTz8xfLR05gKXKrOoNshpJEKhhw40Se6oMJbE27odxRmOPITKoQCGf4vNcDCGblFnq7snTw7wcVY6YYzGTeZoCed1G4yw==
X-YMail-OSG: 2RSR1SQVM1lKcZW.3v7wDVP5e1XKBVuNI05cyiuSqMLgswJGJeHBIlUbaXokbNM
 aR0D0H6aYn48qfy4UHQIurRdceaTvNjgrF1uilD5Ozgt2WtnQ59HDQa5p3.vSdXpJ.EM7ppCEF4C
 WdstnAkq5Pwgu50cmUZEGgvyXxj0R7A2D_5dNQlZ1ub4QzkMi4hg2ok5gVJhlZsxtmO5C6DFdnQX
 Q7ewaeMySE_OMJAwZzY.tHp.TTYXWjnmcRjcQ8TeMCZrs4ly2AVkqx72YFqNMKCZGO3r74cbnw2K
 0e_jqeIyA0cNzlGZW25FbHZuOzE7VpjWV0N1XK_HuYnjwvxIufzeiGVKFBCaGImXmSVPUFI5oqNu
 QfGCO5Knrrf38SrCCVHBJBGeELx4FqScy1NXVWbiGXFvQrGZUz9goDl6a8uvIsvtFLdZDYc.1JSk
 .mR.eFI6l3xFU54Ejef6gzfw2Yhemynlwu6roBosn4yz3BGNwyJKW20Z8LLoCO9zP5wQxReRHsdk
 5j9TPPK2t15DQB00YoJgm0AgdW5QEFayW8v_ljrbWkRIXumQQo5GwQC5ClezsC1MKin50rWsa0cw
 wWfb4PMffAzV_TZThK_yzz42YP7E57M.t0N_u7n_ievg0Ja2GysvULanIPWQw890VYSSI0uDv6Jp
 M.L_BJSi1SWllzUohabvsTWoHeerD3BlIHR8Nto_3lZ8Q.MTjufY4oUIcwpM1GWQ09A6zzo1xUPb
 EvTPtc6l0Ia.casRf35aL.nmFwQSeo4z6MMwIQ5cVBJo28lil.d9p5KQuJFWCOfP41xgVeLEY_WD
 V30BzfaSYHEIoHQ6RRhx89URMF.QLk_g0o0IP4oQGZX3pvmSn6UUypgjcRmGwyURtVZa6Wl1LIAd
 Ud1m9qX18jZjP01Q25_HZyyRzNUNxg66th334dGQImNSyXlJh5m0Bk8Ino_ZH.wAhvFiO.EMz9.u
 4E7hlc7mO.Qql4A1ag.o5Tao1Dg16t6_pH7JoPvGira9zXMMQGj9K0fnN4BS9fcOPvjXGY.gPMG6
 jC3XTl2Alo.T9lrzlVh23sCulm4V6isF0q1NanUmu5QWuDblWyFILiuohkForxtYOO4kafGxyQDC
 bwSV12TNuHNEOngGuvo326SUEKD1hRFGr9TE3R3shwauLo7S1ClOtDM_1TX6FXKJkBgfIWclnZ3X
 T4FZPHQEaKesPL7tkraFxpL_aKrjQOYhGB7o7KylN59E5dg2gtABogoZpjp20Hd.VTLTy9ntJ1St
 D4Ozlr_edkIo_WI9M98bKzZZc78xtx2azneTePvDebwLaTU516tFRjbxN.lof5IINhyXELArIkoD
 .D7HE4YhnL82SyxLtpDD5q3LZs8HR0n_XlIN8G9d0O3TZCqUppx54AUbCCMBDrHc2wHvF_qtWlco
 BuOCBPuAd2GUlaxz7.uFjnk5Kr6yzfS7FuKtTVVpqzKpoFMoxlZ.y.gd2o0oW5bfim_lo_PFyAKt
 PEeAWgPuqTg61lCKJQ0q3R.d9EOrDpm2Gsuq.f.yEIv3s9Qrdn2Br9FWHFv2Wi7KsjUSs.e2PNIs
 m62nGi5RYVTokpQusXf4u2H5tKOC.g.NozCQOyFDzK67dxQNPdmNUqqVCIwv6RbZGsucHSXjf8gj
 rYIafZkEizylPw9K3LD.n_Td1QajO2zN407LNUmzwlibhbWMrfJYfVm40ng5d7K7NQAoHncbR7Ct
 tKdBdmJQzgiN1BY24Upbklo1bhDuaA_CxEojh8y7joG6Mk5JRs0G6o1SznDOwvBKOYm8XzyooG5P
 S8VrO6ShtT0qgefky901wooveADLup4XM4nbWxw2wMkdKhCny1KvabJPkPSmM72kKEf1jhYvq8p4
 YCjZYNTMWeImnb7CCiTi_R2u.xA8Z4Z9whAC0G26jLcj25biuQU_vNk672zbqisTZDgL6SQqa9TQ
 WY3DgvEP1VOxz19uhEGSBI54SexzmNPhpBGD6hY.3Xh54Zu1QtbbBwfRJjgur0sNBTy3cmP7WLpJ
 vu6H_VKIRDpjPSnbY9sRSYkzUkAYgOFkDe6ic59zVrk2E6ys3yU.OHB1LuIB4fhF5kEgkPQ7Xyff
 2cYwO1lc4AvLanhPbdUGpWRYvtwrHLAREw_s7TwjEXr2UCHONFOoBU.f_qlgNqaVQvpBdtX9UZTV
 Bx3Fqgcq8cpGXbiDQnuM9D.1WHdc2T_8lnKyWWta5C.g8VK7gWFjKDGQGZhymo0kK99Cn_2W2Gol
 8ERtznET0VCc2H6ZSdAW_3mvJai0Zlg--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: 2263bd0a-496f-4d02-80a4-ee47ee09203d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sat, 3 May 2025 00:35:03 +0000
Received: by hermes--production-ne1-9495dc4d7-lq7tf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1d80a2cc3a8d35048a72f8dd9de3550e;
          Fri, 02 May 2025 23:54:33 +0000 (UTC)
Date: Fri, 02 May 2025 19:54:27 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Re: amdgpu: black screen 70% of time on boot
To: linux-kernel@vger.kernel.org
Message-Id: <RQRNVS.83A04SOZGQ9O1@att.net>
In-Reply-To: <1PEJVS.CLHTCJY89UP42@att.net>
References: <1PEJVS.CLHTCJY89UP42.ref@att.net> <1PEJVS.CLHTCJY89UP42@att.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Wed, Apr 30 2025 at 03:22:13 PM +0000, Steven J Abner 
<pheonix.sja@att.net> wrote:
>  Having issue with firmware.

To hopefully help, I slowly added firmware as kernel called for. After 
adding 'raven_mec.bin' the kernel didn't boot. After adding 
'raven_mec2.bin' it booted but this time stated in dmesg amdgpu was 
running but no display output with console abilities. Added the 
remaining 2 kicker_rlc and dmcu.
 In preliminary test max was 4 blackouts and now closer to 50% overall. 
Sure beats 12 max :) Also forgot to mention firmware add ins were at 
make -j2 instead of kernels max of -j4.
 Not part of list so could you please CC me on possible responses.
Steve


