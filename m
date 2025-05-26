Received: from o1.sg.calendly.com (o1.sg.calendly.com [149.72.200.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879DD28EA
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.200.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748222642; cv=none; b=meklZAt8azpc7ngoycuONS+AisnNmSWygTaKKOVKb+vlLANftM6TBRNdRP9R/kCiBasZ4kIMA4HnRJ0hUv8+8m1gwnsNAWeo9lswxktOY+iAMUikUf7r7eAX0Bfl1ha/qu0mUtOnh0rrvVnGae/rJCE/Nii4YfTtCz1PhTAstfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748222642; c=relaxed/simple;
	bh=MJ1pDIVzlwgE9ZJHA4drA+GRLzYP1kAKOrkxlRuK4u4=;
	h=Content-Type:Date:From:Mime-Version:Message-ID:Subject:To; b=BNFbjIUukntPy+68Kx2vU3LIs94/Dyvc3ILsD0Z9kYDmwbP5MLc1cMCmS3BUK1VZQ1EngsUlRCDjJSoAWooETfhbDL1O2iHCornoLkM5oaCDGT/xI/ze0f7juC1XADUf6Z341zmSQfWYuM6qcfIejeoXexyojndAInbKLW+Lrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calendly.com; spf=pass smtp.mailfrom=em1618.calendly.com; dkim=pass (1024-bit key) header.d=calendly.com header.i=@calendly.com header.b=G+zHGOjc; arc=none smtp.client-ip=149.72.200.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calendly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1618.calendly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=calendly.com header.i=@calendly.com header.b="G+zHGOjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calendly.com;
	h=content-type:from:mime-version:subject:reply-to:list-unsubscribe:to:
	cc:content-type:from:subject:to;
	s=d; bh=Ddd7UAPLlZ1jVF1HAu2BweYFS5uqHp5jPOYdW6aJbcI=;
	b=G+zHGOjcOWsTgmgtILrfMJQ+NrISP3Zsh48wNFGpEeN90DbLkJm9QvBBmYWz9qlA1tjC
	w58oVK+IS+3fvw15C+hIPesWyA3iimJUnGDdjYGYIUlWn/bweI//n2t0gqBNfBCyBELHFs
	+yFyhOhUMdVdRdQR1s3UtulYsMYk7kxC4=
Received: by recvd-canary-cb957bf78-f8fdm with SMTP id recvd-canary-cb957bf78-f8fdm-1-6833C2AF-20
	2025-05-26 01:23:59.367210655 +0000 UTC m=+4072569.075422967
Received: from MTM3NjY0OTc (unknown)
	by geopod-ismtpd-37 (SG) with HTTP
	id qOO214dFTwS1o3oCmI7MTQ
	Mon, 26 May 2025 01:23:59.365 +0000 (UTC)
Content-Type: multipart/mixed; boundary=030831bf05caf612d0b361aeb42def4efaf15a450ab49e88c1a84599104c
Date: Mon, 26 May 2025 01:23:59 +0000 (UTC)
From: Calendly <no-reply@calendly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <qOO214dFTwS1o3oCmI7MTQ@geopod-ismtpd-37>
Subject: coinbase.com: Verification Wallet with Coinbase.
Reply-To: no-reply@calendly.com
categories: invitee/invitee/confirmation
X-SG-EID: 
 =?us-ascii?Q?u001=2EPb69MZZIXej1vY6FJpl0HrmHbqxhKSTqAKqNIr2M2Jn9jmVPO=2F61NjdJZ?=
 =?us-ascii?Q?tb3zPzRd6nG8RToAMA0hzquJDoeJBBCjY5+Q8xy?=
 =?us-ascii?Q?ALqM9Hf5AQSdXfc6sDcTOBsCIgx7XolqbZt1Tcx?=
 =?us-ascii?Q?KpKtU50GFgpARoK+xEBOHiF8gRUcbW=2F1p5TbEKe?=
 =?us-ascii?Q?6vwSi5lmYDP+5pZL=2FK=2F9zVboAtUyNJX4z8BV2Nq?=
 =?us-ascii?Q?ss861LCCk4X+qaBtP3iwYIC51DBil+XeCrp=2FnTt?= =?us-ascii?Q?sTnm?=
To: linux-kernel@vger.kernel.org
X-Entity-ID: u001.WmdW7KwdgwZ3/goc1xTppw==

--030831bf05caf612d0b361aeb42def4efaf15a450ab49e88c1a84599104c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=iso-8859-1
Mime-Version: 1.0

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.=
w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=3D"http://www.w3.org/1999/xhtml" style=3D'font-family:"Proxima =
Nova", "proxima-nova", Helvetica, Arial sans-serif'>
  <head style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ari=
al sans-serif'>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width" style=3D'font-fa=
mily:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8" =
style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-=
serif'>
  <title style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ar=
ial sans-serif'>Calendly</title>

 =20

<style>a:visited{color:rgb(0, 105, 255)}
a:link{color:rgb(0, 105, 255)}
@media only screen and (max-width: 600px) {
a[class=3D"btn"]{display:block !important;margin-bottom:10px !important;bac=
kground-image:none !important;margin-right:0 !important}
div[class=3D"column"]{width:auto !important;float:none !important}
table.social div[class=3D"column"]{width:auto !important}
}</style></head>


  <body bgcolor=3D"#ffffff" style=3D'font-family:"Proxima Nova", "proxima-n=
ova", Helvetica, Arial sans-serif;-webkit-font-smoothing:antialiased;-webki=
t-text-size-adjust:none;height:100%;width:100% !important;background-color:=
 #ffffff'>
    <div class=3D"main-wrapper" style=3D'font-family:"Proxima Nova", "proxi=
ma-nova", Helvetica, Arial sans-serif;padding: 20px 0; margin: 0 auto; max-=
width: 600px;'>
      <!-- BODY -->
  <table class=3D"body-wrap" style=3D'font-family:"Proxima Nova", "proxima-=
nova", Helvetica, Arial sans-serif;width:80%;margin:20px auto 0;margin: 0 a=
uto; border-bottom: 1px dashed #dadada;'>
    <tr style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ari=
al sans-serif'>
      <td style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, A=
rial sans-serif;text-align: center; padding-bottom: 20px; '>
        <p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, =
Arial sans-serif'>
          <img src=3D"https://d3v0px0pttie1i.cloudfront.net/uploads/user/av=
atar/43721005/f73726d4.png" width=3D"45" height=3D"45" alt=3D"Coinbase" sty=
le=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-ser=
if;max-width:100%;-webkit-border-radius: 40px; -moz-border-radius: 40px; bo=
rder-radius: 40px;'>
        </p>
      </td>
    </tr>
  </table>

<table class=3D"body-wrap" style=3D'font-family:"Proxima Nova", "proxima-no=
va", Helvetica, Arial sans-serif;width:80%;margin:20px auto 0;margin: 0 aut=
o 0; font-size: 16px;'>
  <tr style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial=
 sans-serif'>
    <td style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ari=
al sans-serif;color: rgb(26, 26, 26); line-height: 22px; padding-top: 30px;=
'>
     =20
        <div class=3D"user-customizable-area" style=3D'font-family:"Proxima=
 Nova", "proxima-nova", Helvetica, Arial sans-serif'>
<p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sa=
ns-serif;font-size:16px;margin-top:12px'><strong style=3D'font-family:"Prox=
ima Nova", "proxima-nova", Helvetica, Arial sans-serif'>Coinbase Wallet Ver=
ification</strong></p><p style=3D'font-family:"Proxima Nova", "proxima-nova=
", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'><br style=3D=
'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'><=
/p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial=
 sans-serif;font-size:16px;margin-top:12px'>Dear valued customer! linux-ker=
nel@vger.kernel.org</p><p style=3D'font-family:"Proxima Nova", "proxima-nov=
a", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>We are carr=
ying out a routine check on all connected wallets on our platform.</p><p st=
yle=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-se=
rif;font-size:16px;margin-top:12px'><br style=3D'font-family:"Proxima Nova"=
, "proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'font-family:=
"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;=
margin-top:12px'>Our system has shown that your Coinbase wallet has not yet=
 verified. this verification can be done easily on the page below.</p><p st=
yle=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-se=
rif;font-size:16px;margin-top:12px'><br style=3D'font-family:"Proxima Nova"=
, "proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'font-family:=
"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;=
margin-top:12px'>Due to the new update on NFT &amp; Coins, <strong style=3D=
'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'>a=
ll unverified account will be suspended on Tue, May 27th, 2025</strong>.</p=
><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial s=
ans-serif;font-size:16px;margin-top:12px'><br style=3D'font-family:"Proxima=
 Nova", "proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'font-f=
amily:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size=
:16px;margin-top:12px'>Please use the ''Connect wallet verification'' butto=
n bellow.</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvet=
ica, Arial sans-serif;font-size:16px;margin-top:12px'><a href=3D"https://ca=
lendly.com/url?q=3Dhttps%3A%2F%2Fs45.registerdomain.net.za%2F%7Ebvfbever%2F=
connect%2F&user_uuid=3D4c68294e-f675-4cfd-b0a4-2dcd684966e8&stage=3D1&hmac=
=3D984c404bb8bf00ea9453f86b0590f57c1cc73386a4c0131f6f7617ce8cc31f97">Connec=
t wallet verification</a></p><p style=3D'font-family:"Proxima Nova", "proxi=
ma-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'><br s=
tyle=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-s=
erif'></p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica=
, Arial sans-serif;font-size:16px;margin-top:12px'>We appreciate your suppo=
rt and understanding, As we work to keep the blockchain a secure environmen=
t.</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ar=
ial sans-serif;font-size:16px;margin-top:12px'><br style=3D'font-family:"Pr=
oxima Nova", "proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'f=
ont-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font=
-size:16px;margin-top:12px'>Kind regards</p><p style=3D'font-family:"Proxim=
a Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-=
top:12px'>Coinbase</p><p style=3D'font-family:"Proxima Nova", "proxima-nova=
", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p st=
yle=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-se=
rif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima=
 Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-t=
op:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Hel=
vetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D=
'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;fo=
nt-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova"=
, "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12p=
x'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica=
, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-=
family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-siz=
e:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "pro=
xima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0=
</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Aria=
l sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family=
:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px=
;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-n=
ova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p=
 style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans=
-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Prox=
ima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margi=
n-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", =
Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=
=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif=
;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima No=
va", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:=
12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvet=
ica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'fo=
nt-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-=
size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "=
proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=
=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, A=
rial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-fam=
ily:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:1=
6px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxim=
a-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p=
><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial s=
ans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"P=
roxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;ma=
rgin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova=
", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p st=
yle=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-se=
rif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima=
 Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-t=
op:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Hel=
vetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D=
'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;fo=
nt-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova"=
, "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12p=
x'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica=
, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-=
family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-siz=
e:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "pro=
xima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0=
</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Aria=
l sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family=
:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px=
;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-n=
ova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p=
 style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans=
-serif;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Prox=
ima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margi=
n-top:12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", =
Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'>=A0</p><p style=
=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif=
;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima No=
va", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:=
12px'>=A0</p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvet=
ica, Arial sans-serif;font-size:16px;margin-top:12px'><br style=3D'font-fam=
ily:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'></p><p sty=
le=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-ser=
if;font-size:16px;margin-top:12px'><br style=3D'font-family:"Proxima Nova",=
 "proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'font-family:"=
Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;m=
argin-top:12px'><br style=3D'font-family:"Proxima Nova", "proxima-nova", He=
lvetica, Arial sans-serif'></p><p style=3D'font-family:"Proxima Nova", "pro=
xima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'><br=
 style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans=
-serif'></p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helveti=
ca, Arial sans-serif;font-size:16px;margin-top:12px'><br style=3D'font-fami=
ly:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'></p><p styl=
e=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-seri=
f;font-size:16px;margin-top:12px'><br style=3D'font-family:"Proxima Nova", =
"proxima-nova", Helvetica, Arial sans-serif'></p><p style=3D'font-family:"P=
roxima Nova", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;ma=
rgin-top:12px'><br style=3D'font-family:"Proxima Nova", "proxima-nova", Hel=
vetica, Arial sans-serif'></p><p style=3D'font-family:"Proxima Nova", "prox=
ima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'><br =
style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-=
serif'></p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetic=
a, Arial sans-serif;font-size:16px;margin-top:12px'><br style=3D'font-famil=
y:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'></p><p style=
=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif=
;font-size:16px;margin-top:12px'>=A0</p><p style=3D'font-family:"Proxima No=
va", "proxima-nova", Helvetica, Arial sans-serif;font-size:16px;margin-top:=
12px'><br style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, A=
rial sans-serif'></p><p style=3D'font-family:"Proxima Nova", "proxima-nova"=
, Helvetica, Arial sans-serif;font-size:16px;margin-top:12px'><br style=3D'=
font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial sans-serif'></=
p><p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Arial =
sans-serif;font-size:16px;margin-top:12px'>=A0</p>
</div>




<div class=3D"section" style=3D'font-family:"Proxima Nova", "proxima-nova",=
 Helvetica, Arial sans-serif;margin-top:15px;margin-bottom:40px;text-align:=
center'>
<div class=3D"add_to_label" style=3D'font-family:"Proxima Nova", "proxima-n=
ova", Helvetica, Arial sans-serif;font-size:12px;font-weight:bold;line-heig=
ht:14px;text-align:center'>
This event should automatically show up on your calendar. If needed, you ca=
n still add it manually:
</div>
<a href=3D"https://calendly.com/invitees/a3eea731-3824-44be-bac6-e521f61e24=
df/ics" style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ari=
al sans-serif;color:rgb(0, 105, 255);text-align: center; display: inline-bl=
ock; width: 220px; padding: 15px 0; margin: 20px 5px 0 5px; color: #fff; fo=
nt-size: 14px; text-decoration: none; border-width: 1px; border-style: soli=
d; mso-padding-alt: 0; mso-border-width-alt: 15px; border-color: #0069ff; b=
ackground-color: #0069ff;' target=3D"_blank">
Add to Calendar
</a>
</div>





    </td>
  </tr>
</table><!-- /BODY -->

<!-- FOOTER -->
  <table class=3D"footer-wrap" style=3D'font-family:"Proxima Nova", "proxim=
a-nova", Helvetica, Arial sans-serif;width:80%;margin:0 auto;clear:both !im=
portant;margin: 30px auto 0; border-top: 1px dashed #dadada;'>
    <tr style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, Ari=
al sans-serif'>
      <td style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, A=
rial sans-serif;color: rgba(26, 26, 26, 0.6); padding-top: 15px;'>
        <p style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica, =
Arial sans-serif;font-size: 12px; text-align: center; line-height: 22px'>
          <a style=3D'font-family:"Proxima Nova", "proxima-nova", Helvetica=
, Arial sans-serif;color:rgb(0, 105, 255);color: rgba(26, 26, 26, 0.61)' hr=
ef=3D"https://calendly.com/notification_subscriptions/a3eea731-3824-44be-ba=
c6-e521f61e24df/opt_out?owner_uuid=3D4c68294e-f675-4cfd-b0a4-2dcd684966e8&a=
mp;recipient_id=3D1291895238&amp;recipient_email=3Dlinux-kernel%40vger.kern=
el.org&amp;opt_out_method=3Dbutton&amp;event_uuid=3Dbaa37eef-8fff-4989-a732=
-80aea147fede&amp;event_type_uuid=3D068e7f03-6520-4eac-be49-a3f8c3439d88">U=
nsubscribe from notifications about this event</a>
        </p>
      </td>
    </tr>
  </table>
<!-- /FOOTER -->    </div>
  <img src=3D"https://click.calendly.com/wf/open?upn=3Du001.1UC-2FG1r4q2F7W=
-2BfmxQXtFUdP3-2FWuQ-2B-2FKfRpV0IUgiPoI3JASCBSDANB0u2W5r68EhmZ1uy2720Xx26of=
awnDtri3PGCxqc1hARhQ3m6goxOi-2BIgTLRwHfNKYBVQ4sjDo2g1-2BIoFNrXfX8zzgxh8o7mb=
gOgA7SxBJy2yqs315V7acGAeiz0mDJlXsEPkxP1Robtr4BO1gKn6NM8JHV6fP0K2qqqEmgtcHr1=
b6F2VEPUE-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"heigh=
t:1px !important;width:1px !important;border-width:0 !important;margin-top:=
0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-le=
ft:0 !important;padding-top:0 !important;padding-bottom:0 !important;paddin=
g-right:0 !important;padding-left:0 !important;"/></body>
</html>

--030831bf05caf612d0b361aeb42def4efaf15a450ab49e88c1a84599104c
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64
Content-Type: text/calendar; charset=utf-8; name="invite.ics"

QkVHSU46VkNBTEVOREFSClZFUlNJT046Mi4wClBST0RJRDotLy9DYWxlbmRseS8vRU4KQ0FMU0NB
TEU6R1JFR09SSUFOCk1FVEhPRDpSRVFVRVNUCkJFR0lOOlZFVkVOVApEVFNUQU1QOjIwMjUwNTI2
VDAxMjM1N1oKVUlEOmNhbGVuZGx5LTEyOTE4OTUyMzgKRFRTVEFSVDoyMDI1MDUyOFQwODMwMDBa
CkRURU5EOjIwMjUwNTI4VDA5MDAwMFoKQ0xBU1M6UFVCTElDCkRFU0NSSVBUSU9OOkV2ZW50IE5h
bWU6IFZlcmlmaWNhdGlvbiBXYWxsZXRcbkRhdGUgJiBUaW1lOiAwMTozMCAtIDAyOjAwIChQYQog
Y2lmaWMgVGltZSAtIFVTICYgQ2FuYWRhKSBvbiBXZWRuZXNkYXlcLCBNYXkgMjhcLCAyMDI1XG4K
T1JHQU5JWkVSO0NOPUNvaW5iYXNlOm5vLXJlcGx5QGNhbGVuZGx5LmNvbQpTVU1NQVJZOlZlcmlm
aWNhdGlvbiBXYWxsZXQgd2l0aCBDb2luYmFzZQpUUkFOU1A6T1BBUVVFCkFUVEVOREVFOm1haWx0
bzpsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkVORDpWRVZFTlQKRU5EOlZDQUxFTkRBUgo=
--030831bf05caf612d0b361aeb42def4efaf15a450ab49e88c1a84599104c--
