Received: from sonic306-24.consmr.mail.ne1.yahoo.com (sonic306-24.consmr.mail.ne1.yahoo.com [66.163.189.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513B247299
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027152; cv=none; b=nAt+CJmk+r3cHFjxVeVdnOFUJbdvc5AnCZ9kAEfzA094N4dtrZGYAkZweafz03O29ffgBTdfaEJWla+hjCJ9zOAk7ztwwnlT1cB+aJLU0Pcsp5vmN/7h5OiqPfUz+ttm1zPg4Eq5dIY+9P5pWAoOl1usHRh0ovfYAON6puN0l58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027152; c=relaxed/simple;
	bh=rI8tGOhXhDDVDq6fjyuKaqcWEtn1hWI58nlMpB4x0ks=;
	h=Date:From:Subject:To:Message-Id:MIME-Version:Content-Type:
	 References; b=QGiM+MkX+56nXoyr1BXLP61M/cLapban9uIB4sEv1wKS5KotTxXxpX0nMai13hBo2V4iRNbpsIllmz+0uklcS3xXlxhOCjSre9x0BHSkwO5+B6B2aQTO6WRFjMR6IYLO4NYC5/CBingsdEP4+7OBpwV4awBIn1mJZyG3fe0jfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=pass smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=Rg+wWLjZ; arc=none smtp.client-ip=66.163.189.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="Rg+wWLjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1746027149; bh=KSVIM7aBkfKOKvpwNb75/OPsByk4QjayQ3E/GDlaPHY=; h=Date:From:Subject:To:References:From:Subject:Reply-To; b=Rg+wWLjZdbmNzqindkX5Nztd/bm34fZqeaPqvyeD/3ioeJDRAp9rZUYpBCDbIHT3yLMUr2dL9sVyJ9Xjx4FeF9mGwdpoKBFgcKSiiHTnyJSnKlmQ6Hagw76YjfHVfL0hfHf6LaePQS8cuz04S4Yp2hwV9QFXVg/HM/EPyW5YCqE=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746027149; bh=1p8OXK4wMfUNuopUoNHubrb7QGKjOt0a5IJaoksflcb=; h=X-Sonic-MF:Date:From:Subject:To:From:Subject; b=nMYMyE/PTpCtvPmCfazyYaBW/42SdKoRNvZx9nVgmdcECwpV9IZO0oKIDr2oQR9B0F9ofZ58sLGfVNm+WB6EmDhoFJxLOdbBUeKOo8PKNRArzrTKOWKZ9d0mEsk7+YAcyx+bfYOXfCi1IQ9qAyK9G0zKGeAy7WUJhkSIogjbx5HhDGcauGWP2n23/r6CFTJuFGrUWCmk+is7YC+4Ng39PrZ0MrJ7UkH6//I79IFzm80L9NhdOmCty09R0DkOjVeV5RFuxDkbL0U78eBg6uwg5KY2DMhuHV6oaBEg0rNTxqxtgswyNGb7p5Ar+pr5NwsDh5UXCfH6xkURFnBuvaofoA==
X-YMail-OSG: VR7SZYoVM1mHDhCJM0A1iiowf0H7c.JUSwk13.0JCrHO2XG1J3Kqlkd0yXMXTAr
 h1EEjKk0bup666z24V054Mfn.7cftIb5P2rmlrXCmhCQJ5Qbgg4fC9.UUxSmZ_Z_qYvICy9I6ZQk
 0WPc5KlkNHv.cNeI7Bth3wwk1_uO7casE7TXbGSefquKEsjCJc7tQ6NJxUH71N_g8MlIqGzlIw9d
 FoZl3A3RzqGynuQjdhQqWVroMf9QaJrm6FXpe4qQJFcbWfiikiE4jNYXjQiT0ne8EhyCiOwBVqkb
 D.uLQTl.UBJLMYVTbMmZPPKNL6ZKIMp4q1t2JtgCckV9Y8Q_9OQMWBvbJSi4vAvNxSyYq.gVwMYm
 3AnXvuCf7wUV5FPAWvo41c2XCzwpepDYne_5s0O1b7dZf7zQdt6jLv8CmbhJepoFxfbvx8wjFYMX
 M5mgFpJ0w4ZBzMU1VGHvT9fOSgvPPv67DPgJgjJSxpX50ZJP6LEcKR13oKnt6_OFx1Qw1PpWVLwo
 z8kndL.N2yFJXs4WxIchsl5Ky1PpaWd7fXm7jaejt5ejYKothMPZuKE3PJ5Y8gyILRlmWqM4lj.p
 rll.DjuNu0h3yPGkg6sEbZn8mR57iVS.Sodk4.VSOmN081_iNApeQq1d7Na.WkgKGpVk33OA2nNY
 GNwgOXWlj_.T2EIcH5NNGvAprmwajU7YCU6BGaSDMIFwkPWB50jmpuAs0jcaG5y2nw.C.MKlOC29
 OGGEdD30sJn7aOXNjas5YFupwf6oMg._KPxX.341NC_guvxWgMZkWeOaDxlJiD9B20YR68ruQ0Hz
 h1lrLbMkqHUP6PFWfKKybd7Zo0sL9kgPS8uy7NgVDst921LaR3mQzELsIscLoAZgQsvhJwCCjr7o
 wSJuZDTESMqZSJKNacUdDzHSadWRFxqB53O1_kr8yF02QUosIxk9f9qP9MGj3_ZpJWa_beNG4lWT
 IwCF7lGopRVHG7gn2VPb80JGCZtbhyqNIqQn4gU1pp3O4S6b3lSftVdJ.cdYAaevUhep_Fw0xDpp
 TZQ74dEypfnG1OJm9kDKVBSrNlecxvx7Wo0yzLsCHIQbdlEJu4vRyCXEcAZAMiYVc4.RQ1l3HnqB
 RHElLBzL3C9jTS70QRRmGgUNkiNrLAQe4ChTPE1O6H1K0pewzXhXWahA97iLgXnn4EqP7D7s_Ft1
 dx5fGg76ijNlzLqPR.N1nM1I4EosSObY0kSzXS6C3R9uDb0jdkTzbh8mzGSRTGDjgE8BtE_tC9BD
 ifdv2zmtEPq17sjichzvovNucMVkD7fvrlcjGiJ.D2IHTPQKRIgZdvqsCIDEiAT21C3ppPjdMRqX
 HNJ5lcaHmMFGEAjmEuphWtb8ADTyPsJ5nxmuZNUeL8enXWFlb2hdS8CATnMxoQHMdXHTcbhkuijY
 m73rb8Mp0vPhmbbBvBryh7wXWzLjdrtVyH6umQ4QLV11aBk0djsp3LiPELrZ2KtcFbrZ4yRT1j3M
 ybCldisQJHX2e19d7A7JwtrhFeuvxRdvNHIWRCIf_y1FQJuY1ABQ63._Tn9QijNdaUUCLR3Xx4W9
 RYgBYH9WoNF0t11SuWSmNT7pZjF6sewH1hasPg6qE0Zw2dR9KLWRVJaNzZ3.alHaJ6FGVduK8inZ
 GrffobL.QeX_NQ.uos8Uioh1v7kvlFrK04xUjRn7D1NNxzrwCHHwX_8ruacX4UyimVhDm_jyaTMh
 .e8Uq3nkjsyhUbY4.PBZwnMuAIVVQfW9e44N9zTu5QbZLt_.6_b1Tv.B2jRUV463n.gcjFwh_v7f
 9QBQodz0gA10ruhR55hijM7UHtevBcArAWBVzTZ5orgmNCEIVdrN3_2GWSqpWJeRwLtzzC4skf5j
 Y7MTDcKn4_ohJq9a5vYSm_SN5d4qLDslrmWAeQHrkXOD2pkIV5g0X4hrReWg5UwI4uyadsJTGXeq
 HCNjH.0Gpty5jm_RF2waFkhawp6DASAO3EZRNuum0O4i5YZ2NCA6zzbvufAAImIKDMnhUMzERCKp
 aj2Dyrk8JadCiPeqPfKO2Ri0yCwLUaUEF0kstQoM2lHZxutrfC8MT7qJxQyukv74ClKYv2GqG8vH
 5KCEnti4Vkj0mrnCcp7rnJBll2vuO4x8y25E_OsQNfNanpMKK5zqMLV38pgKEE87JqHoSDNygQ.a
 nRXGlf6U0aE_GuGbxZMEBsWelKrkX8fr.5CIyiHJVhanHZLO.r_0PZ9ZTEAvmdpOyEd_BsMRuNWC
 i8SxHsqbdd7lWgnPH7PcYVg--
X-Sonic-MF: <pheonix.sja@att.net>
X-Sonic-ID: a12ded4b-6047-43a8-b61c-cd1b631334d7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Wed, 30 Apr 2025 15:32:29 +0000
Received: by hermes--production-ne1-9495dc4d7-7dn6v (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c428d61b40ad9c93d7b0c2522f209c0b;
          Wed, 30 Apr 2025 15:22:20 +0000 (UTC)
Date: Wed, 30 Apr 2025 11:22:13 -0400
From: Steven J Abner <pheonix.sja@att.net>
Subject: amdgpu: black screen 70% of time on boot
To: linux-kernel@vger.kernel.org
Message-Id: <1PEJVS.CLHTCJY89UP42@att.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
References: <1PEJVS.CLHTCJY89UP42.ref@att.net>

 Having issue with firmware. 2400g, no OS or LFS build. Linux version 
6.13.4, no initrd.
 Will boot 100% to linux console if I don't use firmware loading, and 
average about 30% of the time with firmware. Clarify: 100% I can use 
linux console, just with firmware I can only see it displayed 30% of 
the boot ups, includes boot output and login prompt.
 Not sure of steps needed to remedy. Dmseg(s) from a non-LFS match in 
the drm, amdgpu outputs:
[drm] initializing kernel modesetting (RAVEN 0x1002:0x15DD 
0x1002:0x15DD 0xC6).
amdgpu: ATOM BIOS: 113-RAVEN-113
amdgpu 0000:0e:00.0: [drm] fb0: amdgpudrmfb frame buffer device
 and dmesg(s) between blanked and displayed of LFS are identical.
Guidance please :)
Steve


