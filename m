Received: from sonic313-12.consmr.mail.ne1.yahoo.com (sonic313-12.consmr.mail.ne1.yahoo.com [66.163.185.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5749376
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746386827; cv=none; b=uQHmmXxfCT+V/meyX+H5di0UUYE0CgjLrbpeGVbnzomxQnssGr5RF+NtdHci80Khb8iVsq0PNClIsgVAoYJktLXQB0EnNxfJkplUgz1lW2B/1hBMWKMSYqQ7P4TEz8M36Sfzlyv+sooMsVMNguf3ozV1E0Eeb7B5k41yk5bUNl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746386827; c=relaxed/simple;
	bh=8U+WkK4jluyo0VHnqhoSr/HfjGEN1CurRngt+rDUNAM=;
	h=Date:From:Subject:To:Message-Id:MIME-Version:Content-Type:
	 References; b=kkvTAG7XgLkbZ3C5KK2+xf4Atj2xgCmpaaFfwD6A94gvEOVBZmQlyWCFqxYYelfIx0NnIXFZ/8u8DMhfB49y8hVWsNt2fCLLpZThdTA0is8vYKJo1gO0jjRnUuvMcRcuRfUZSYFo9pg7ca33njMNUVKP2oIsG8HFMy4pmd6IyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=pass smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=hwVsdPV4; arc=none smtp.client-ip=66.163.185.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="hwVsdPV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1746386819; bh=GgKj4EbLukbp9mBampYxQkfkiaZkSgMHMtZ62AgjTYs=; h=Date:From:Subject:To:References:From:Subject:Reply-To; b=hwVsdPV4LtTs2nqRAnlBcmgmgFpeJX9m3lFN/pXVWIqaE34XgYuoloEHM04E/UE0TjRuTrL1O+hLUxQdgSvWLZRmBsay/B9QMab82IUP28xKbObp7L6FKfXFDP/bbPOQLivqvHzXHuJLxUoLY2Wz+Wvl1/Kiotg1T0vI2BzVcIw=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746386819; bh=cLXrn0S5AdzgqzO8mcofTf2mA5bCT3zhiUpHbEKvnLK=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=ogrgXCRCYzYET9to3d1se8qVKidPYfdgtk/UzGYe2XXGUnRDTUT0omqwd1jD2TSnyswDni9tMJdBFYOymQY9fVut59mLo0JUX+pif+TvNcSB57/MBisjtSRaxI6InFWQno2yHFMW/DJxfTmNO0PEQ7RBhLruQmxxP6I5yh5K9l8D+UxILMk/bxVoccIfl3YpGY6CCVNpBgWiJq7pKDZUTLWy+oUwgTiOFVY2D5+wyt5ACYhDifFMgLtxKLFABZErcZPFc92HugE/BxzTprKO7RThmKx96A7PCYNjji8/I74qYnEqgNo+N4GMGhCPtVFGLDuaZEQSnR/D/Cq9xZLPFg==
X-YMail-OSG: fEAnmoMVM1mfADvP_w208nk7w1MPhAGa713ZvQ9tZ1uAOP6.i42CEMpgx8f34in
 ZAAlp75CTKK5yPwsk9n6O9sE_vCNxCYTsT.Mgnmbyyz4RgMAqGq7.c7V0QBSwOYRLmlQawyVHtPG
 wLfz8V84hEtEpjeOe7ui9aCwOTCK4V97kpeyXB9oncKrZIqNkxTUhgx9S2hS6C6GJqQc_vG8QgMP
 czyqYuFbli9LVKnB8VQdekVdiAEjCtwO.Efzp8TPwltmU.SyaNQKiUIhUoBIGJvb_8HxrZfy0_oL
 2qt7atE9lyiloHJCgcVeFvPMkw_Vx8OiEP5k5HjmiaLkzUyg2gMghA8bnWo138iXmqQrJULpoVQi
 ukEMGHoQ2P11GRUyCFG5Fgh9DGPh27Uf1nNlgIIhpgx32h.RsZQPVra2XndHmtkha7ydQ7xEuIQ3
 0LPYQOiwBlNqwBRIxiwiyt82A8xJpSzbkLkJW2cF0X2IqHlDcyvP87cAZZBd4kxvVWq0q97GVRLe
 30.8UMszK7xEIyMkXqitjHU8zIGr1LiWbMcTqbm1Q08BBQHcYrb795GInMLD33z6gLpiOAB5vXc0
 I2YU4pyNn3IIlZ2YpzAJY_m.niuTYZkHqC4NAoRNvajBLQwS1TT2R2a1L0znyAkSmLKdxykDJ8iM
 A3tRicNbhSIMfov4BlU2S82IalTQ_uweFqz.bJPQiUjNUkM2RN4hRx.AsXFNgOEtGAmONVBhaCRE
 70jxLw7_TKXaqGtbLOcl2vhvAeJ5DwfkBArUzEK7hk.1kpdru1YshztV5WzVrd6IaNN22RmFCZZ4
 H_vVtyvBRJuPukei0gQRmcNnDQxwqJryqBLpF0I9pvOuYCwXWFi66QH8rKGajGPnqaKaZn9NGUlx
 nAJ2fpZFx5EPy4yyPYTgI8Jm9nrA2enqUA.jUVnakarhvmWlergiHM6G6ODxNMHG3i_6Mv3U1gyr
 ozwZbnyHaL7o69061zzbngLslRlVppHu2oR4m_SO62.f_fOgco8whHz4SN_pQb3Laeug1YZ._VUQ
 nEqfW9WkWQTFMn3jzxglYEnPlSq69PB6PnUeuHlC9L.c8VgWMOfND1D0H2f8Ou1HbFK0LuBlQ9Ni
 PhBSgTqY9pcvKlvwxbMkr7J9GnbP0Hw0aar7LTUVJpHI.JsJqywcsFB1yUnqkczYd_tL9w.cFhQq
 4efDcSkRVmWJg_pliMr6srbyW1YQ0G3pCMawi0Bl_UIqSnyiqVasNI_Q4IOqvUcIiTlx2sCWXevS
 766NZ5KrAfZTL0ADdAjjL9Fr53YlV.cG0GZ9f80qUGYr6wMuo6U3o.UFEXcuSiAW1mZBMM2Qz3yE
 hhASzARxclhKdwmtPIYMbbxo52z8.T9GkRD2q5B1PJAms8eDK15OSRC38TNNJpd26NENbU7zdw4b
 gGuqxSHh.70_cC9Ia.oz8Q0AFlRotLOqbPm5SsgFrH_4xOtVhyetrI2gaBf59dSNCANttiM46u_s
 CSQTwXZvrao3.nP_wDQTATAHqudfw5vllNZ78G_rHqWFUEULJclrb04qlIgwBuzJlvoeOyE6MgJ.
 wk6zmg8ow5eVS_ANTQmtvRwd25cgt9fQXKUCjPdRs1E125eOsvQDK5eOPi2Tqiv0wSYubb86se5_
 BVzOpuckJMAX67Tl1NA.0RkDiJi.oWegLRz7C.6iOMMOKFuJo1b1_DjGtAzrz6SYIxHa.S8c48f8
 hIEy8WoyP0mUPnRr3bSUFb2rTT0rhHWKLhOLgs2oojkCMSTCH2aPDSrTLKCv0Qte9GhXZ9hXiof5
 6KSEGqbwwDmsXPykCCdWrRIlpquS7tCfPLlKOzPM9YDkvryRbWRl6a6dIXwqZJyi4CUAJD5y51Mu
 sQxa2EiNwioAX3j3IqvHtBDXEDr4ledW0_VqeG9UjxobHrAtIZM9HyzJ85ycLhpTAjNeOuU0N20P
 Le8VUPTeDoTfLKFk5Yh5Jk95U.y77JjUzKcOyRaLrqBbUigzC73OtM67HgjXsCp3SDcgGK8toU5Z
 rUyka_VF26dBd9ZBqFIgrHeIaZWrco6b21uPIOim4Uir2egLOvHXgcw4ESLv65ltoxezrbSi2DuB
 ErL11vWGiW12jdyWEBnqvDGPqUIlWIozA.tjpNJEIz1MQqE8I2LRbghaeW6KJ6_wjH7Jeyfv31aK
 lzEJdJukY.W3Gx7rtdmqqhniHDqWEffj2RTMoUd3406wnRy5jQGmcTm5XNo_8orh7ZIiS82a3Ln7
 3m22dkKiMDL4mvGCFV.gAWb.TvlehBQ--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: f006822f-cc10-4733-8c63-7df21630d960
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sun, 4 May 2025 19:26:59 +0000
Received: by hermes--production-bf1-689c4795f-m296b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d01299511efab02f3032f3b1fc166e29;
          Sun, 04 May 2025 18:56:31 +0000 (UTC)
Date: Sun, 04 May 2025 14:56:23 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: Kernel bug after 6.1 bug ryzen
To: linux-kernel@vger.kernel.org
Message-Id: <Z93RVS.RPMYFU5Y3A7F1@att.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
References: <Z93RVS.RPMYFU5Y3A7F1.ref@att.net>

 I introduced as amdgpu issue on 30 Apr, but believe it should be moved 
to kernel. This even effects my OS mainline kernel upgrade, tried 6.8.
 I'm on a AMD 2400g, Asrock B450, GCC14.2.0, Binutils 2.44. Successful 
builds of 5.15 and 6.1. Starting with 6.13.4 I encountered display 
blackouts, disconnection of gpu from monitor, with a working console. I 
got the same result downloading on a debian/ubuntu based OS's mainline 
upgrade of 6.8 running a 5.15 kernel. That's when I back-tracked and 
built 5.15 on new LFS system, which I got working, no issue. Proceeded 
to 6.1 using 5.15 config as baseline and got that working 100%. Used 
6.1 as baseline for 6.14 and same issues as before. I ruled out 
firmware since all 3 ran on 250410 download of firmware. Please note 
that on initial 5.15 build I did have to change kernel setting but 
major difference of it didn't disconnect the gpu as 6.1 didn't either. 
Screwy sequence of builds: 6.14, 6.1, OS 6.8, 5.15, 6.1, 6.14. Most of, 
if not all, I found same results using safe mode also. For 'working', 
ran X server with a program I created as test.
 Not sure how to help, other than not use 2400g :) I've seem to run out 
of ideas. But felt since this in OS mainline's upgrades I should try to 
get peoples attention.
Steve


