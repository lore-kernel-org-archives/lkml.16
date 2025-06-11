Received: from mail-oo1-f64.google.com (mail-oo1-f64.google.com [209.85.161.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F511185
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612119; cv=none; b=Wugk1wWMTtp+6H0mn0al4ExPFouVAl69aWYodxxAnN3OBF8ZYoj+8XRRcPIuGIsjwd+eU+wVId1ZRciPG27w462eDc5smZaTyvtx3nL2hVQb9QKQ4N/LFh7oQpMDzHCergDFkLVIMLLolo6LJlSDl96xFHoUx/tVwZydbmLiDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612119; c=relaxed/simple;
	bh=tmjeg8SpgL1hjQHTHZJnA+Fd+TUsw5f+J/3EKKUDF74=;
	h=Date:From:To:Cc:Message-Id:Subject:MIME-Version:Content-Type; b=sVcadMGlEh29QPCFM66hOecUIWY7B1S+TW5qPRLTDs8I053Wwaq6q3oyRr4+1IWXeppi1+9n6T0AMEWf94BSNRZ0QLOW9KXvHbrV/twtzr7B47+wO9EVu+hng6jroBAEdnqh7IM+z9DJh+Gv2TygYjeXLkQbke6fKM3vBfnlaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ancd.us; spf=none smtp.mailfrom=ancd.us; dkim=pass (2048-bit key) header.d=ancd-us.20230601.gappssmtp.com header.i=@ancd-us.20230601.gappssmtp.com header.b=g+csuhdL; arc=none smtp.client-ip=209.85.161.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ancd.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ancd.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ancd-us.20230601.gappssmtp.com header.i=@ancd-us.20230601.gappssmtp.com header.b="g+csuhdL"
Received: by mail-oo1-f64.google.com with SMTP id 006d021491bc7-605fb0efb94so40906eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ancd-us.20230601.gappssmtp.com; s=20230601; t=1749612116; x=1750216916; darn=vger.kernel.org;
        h=mime-version:subject:message-id:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qxLw98Ucxv1opdJhRPU28xqJUARGsE3f1mYIRtxQFQY=;
        b=g+csuhdLRjSKHrtlE9/KCZxHdXOXso99H4d8l7QxeiUWdXOD/Q5nyTMrAczQ5tLlEq
         VBOqknfXAHPmEeqNSZTZndzReoBnC7JVUcW/cSdSoLtiKygtqlxBhgXJqA/xf+PN0gGH
         OID34q95ZA0JpGt4pxIrvy5RRMSX8QOhBbfSBfhHl58VrG0m5yXTGGn97BWhHnyW04gg
         CXX8UPLATxWko8Ec/H86zekwirfpXVrSQ+ASWWaEYt0adnb1MKqSIcwhiznyM0TsCavO
         9KDgSA9Qkv7AjFk8aG15l7fYO+AxS0VKLXtfSJ+Z+GMHLefqafKiIFeEoj4YkNU6l9CP
         NAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749612116; x=1750216916;
        h=mime-version:subject:message-id:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxLw98Ucxv1opdJhRPU28xqJUARGsE3f1mYIRtxQFQY=;
        b=iPRFE6a5lVoSKKs0hH/gW9UbmmyDF4UyanIoqN4fdg7KH0VE7bUJ6sT1xJXQ8NYyIw
         eHgaezNhYQM6ULtXxgSnlNdnkmDsNksiUW2gQS4+r/yua3zJ5GFMqI16wiLZzmAjcHpF
         S7z2oXDizmgmUyim3DfkgDEfU8fy0FMwowDHlzbN33us8/opsd9fWcs53pfqy1bh9TG1
         Q1nzqGoARCIwWeFP7eCDlvfRjpcIxfcAn+GfaSb/5G/QiUoaQl7eZJf+AfjxvLB5P1tq
         1B03XWZ/cQOvwcjR6aGvu+6oFszfLDE3rEpzi8Re0DZaiYklAV1hnF54kNLfzzx9s40Q
         hmxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG03+ReE6z8VYFijJqp55P9t+PqA2qOBU7CpQuPHGFmMna9c+1vQMuuBdDZ3aM6cCeViwP9BJfh7HzpMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhvoJapU776qsfXnpz49rxnTX3mID0OvgKPM4zSCfbAmFnd1IP
	h2Q+WNKCH2cgwg3VWtCBoEoxwI/wPwTceAARZn87tEdoxyBMj7Cs38EKE0oqRLvWdl2Kx95Ddnn
	kQCtnG03RYb+6oQ==
X-Google-Smtp-Source: AGHT+IGGPAlWtjZGocdtPa4hRonFR9L1eeaoIfWpHlEamMSwCPc/vcC02AfB0cftQp8G/Dy+cjw6zSDTIQ==
X-Received: by 2002:a05:6808:1b27:b0:406:682b:881b with SMTP id 5614622812f47-40a5d1f422fmr455555b6e.8.1749612116528;
        Tue, 10 Jun 2025 20:21:56 -0700 (PDT)
X-Google-Already-Archived: Yes
X-Google-Already-Archived-Group-Id: 321edb17f5
X-Google-Doc-Id: 425beb64bf9ed
X-Google-Thread-Id: 5e9c549522688635
X-Google-Message-Url: http://groups.google.com/a/ancd.us/group/aitanholmesdem/msg/425beb64bf9ed
X-Google-Thread-Url: http://groups.google.com/a/ancd.us/group/aitanholmesdem/t/5e9c549522688635
X-Google-Web-Client: true
Date: Tue, 10 Jun 2025 20:21:55 -0700 (PDT)
From: Email Marketing software <aitanholmesdem@ancd.us>
To: Email Marketing software <aitanholmesdem@ancd.us>
Cc: colinesoria@michaelreid.com.au, principaljac@tnau.ac.in,
	amit65423@gmail.com, tkloke@doctors.org.uk, dkhurana@pu.ac.in,
	communications@oriel.ox.ac.uk, admin@wandcareall.org.uk,
	TRidley@kurbingui.org.au, techniques@techniques83.com.sg,
	info@bacacharity.org.uk, media@museumofbrisbane.com.au,
	execdir@rgd.ca, info@zipcourier.com, jane@jerichoroad.org.uk,
	linux-kernel@vger.kernel.org, sanjiv@yfcaviation.com,
	jamo@jamo.ind.br, info@lambtoncollege.ca, honcon@phconsulatesd.org,
	lc-farhangian@iaps.info, commerciale@queenonline.it,
	lodgepunjabno.129@gmail.com,  <Scottyjay13@hotmail.com>
Message-Id: <0a51172d-f812-438d-9899-f56c7c9489f0n@ancd.us>
Subject: =?UTF-8?Q?High-speed,_Bulk,_Multi-th?=
 =?UTF-8?Q?readed,_Built-in_Proxies_=EF=BC=8E=EF=BC=8E?=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_38028_1604984270.1749612115996"

------=_Part_38028_1604984270.1749612115996
Content-Type: multipart/alternative; 
	boundary="----=_Part_38029_1559734816.1749612115996"

------=_Part_38029_1559734816.1749612115996
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



=E2=9C=94. Thousands to hundreds of thousands of emails sent per day.=20
=E2=9C=94. The only software on the market that uses Web mode + Http protoc=
ol to=20
send mail. It completely simulates the manual login and sending of Chrome=
=20
browser.=20

=E2=9C=94. One-click start, Http protocol,Fully Automated, High-speed, Bulk=
,=20
Multi-threaded,Built-in Proxies.

=E2=9C=94. Free full-featured trial for 3 days.

SITE: psce.pw/softcenter

TG: wowofrom2008

=20

*count penalisemock penaliseproofread penalisehypocrisy penalise.*

------=_Part_38029_1559734816.1749612115996
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<p><font color=3D"#800000"><font size=3D"5"><span style=3D'text-align: left=
; color: rgb(0, 102, 0); text-transform: none; text-indent: 0px; letter-spa=
cing: normal; font-family: "Microsoft YaHei"; font-size: medium; font-style=
: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline=
 !important; white-space: normal; orphans: 2; widows: 2; font-variant-ligat=
ures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial;'>=E2=9C=94. </span>Thousands to hundreds of thousand=
s of emails sent per day. </font></font></p><font color=3D"#800000"><font s=
ize=3D"5"><span style=3D'text-align: left; color: rgb(0, 102, 0); text-tran=
sform: none; text-indent: 0px; letter-spacing: normal; font-family: "Micros=
oft YaHei"; font-size: medium; font-style: normal; font-weight: 400; word-s=
pacing: 0px; float: none; display: inline !important; white-space: normal; =
orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: n=
ormal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;'>=E2=9C=94.=
 </span>The only software on the market that uses Web mode + Http protocol =
to send mail. It completely simulates the manual login and sending of Chrom=
e browser. </font></font><p><font color=3D"#800000"><font size=3D"5"><span =
style=3D'text-align: left; color: rgb(0, 102, 0); text-transform: none; tex=
t-indent: 0px; letter-spacing: normal; font-family: "Microsoft YaHei"; font=
-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; flo=
at: none; display: inline !important; white-space: normal; orphans: 2; wido=
ws: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial;'>=E2=9C=94. </span>One-clic=
k start, Http protocol,Fully Automated, High-speed, Bulk, Multi-threaded,Bu=
ilt-in Proxies.</font></font></p><p><font size=3D"6"><font color=3D"red"><s=
pan style=3D'text-align: left; color: rgb(0, 102, 0); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: "Microsoft YaHei"; =
font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px;=
 float: none; display: inline !important; white-space: normal; orphans: 2; =
widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-decorat=
ion-style: initial; text-decoration-color: initial;'>=E2=9C=94. </span><fon=
t face=3D"Microsoft YaHei">Free full-featured trial for 3 days.</font></fon=
t></font></p><p><font size=3D"4">SITE: <a href=3D"psce.pw/softcenter">psce.=
pw/softcenter</a></font></p><p><font size=3D"4"><font color=3D"#333300">TG<=
/font>: <font color=3D"#800000">wowofrom2008</font></font></p><p><font colo=
r=3D"#800000" size=3D"4"></font>&nbsp;</p><p><strong>count penalisemock pen=
aliseproofread penalisehypocrisy penalise.</strong><font color=3D"#0000ff">=
<br /></font></p>
------=_Part_38029_1559734816.1749612115996--

------=_Part_38028_1604984270.1749612115996--
