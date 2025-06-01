Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41B18E20
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 04:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748753811; cv=none; b=p4rrMUAemrcqX8loZZlrdNAT3pTjKh8IF3iBNa3a4Abe9Hxj+TUqm3R+xzAenUtQlDyyOXP97dqGIfyMizv00/JTzElhcLCoR8WIQ2Q4MnJlaW7k312sIJxlJml5KVwCf1h+M/oPT3W+m9Op0v74to/5eYZNxYuXzfu0JXOAjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748753811; c=relaxed/simple;
	bh=1f3OagmzEZG8vztNo7su1/gNeBHaGLoRzxkZWbbweS4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BtoMFhGO+34TVxQl0utxJ4PQMcOTf6d8Cf4/vTyUiC3gb4AoPdWZavFm1AFCAni1XRdnbAh9GpKzRdBto0dFLoHuTQgjcc76NOqcgBlheVLgVwYkZFWO/LB/XAgbV6VTYU8Mo539OQzqDtogFDHL6RMZs7QvV7BnBPNR39wY4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=muzHpFMN; arc=none smtp.client-ip=109.224.244.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="muzHpFMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1748753801; x=1749013001;
	bh=1f3OagmzEZG8vztNo7su1/gNeBHaGLoRzxkZWbbweS4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=muzHpFMND29eRe8z3CwvlVBKsg4pjU1zLmRBH2UzKTmvNMWjfPa5JT2YYP1koshSP
	 9Jvhen5CrMmXKvEe1jN63LHOIalHkGmXIjIgK/SpCYzGwUQywLHH7e0mvpiIKCDGjV
	 1WlAaJlqEOG48Chz91mbC/DvZGf0akIdkRBAxdbDOwZFDTUbe0vqiSmUjZh5ZA49p+
	 Xpt2UxeMl1zpVWVNr4AArfBoIayhj3XAbB0WweO2qYzuEfXOyw/rQH75ha0rMsOxIc
	 LV3Wuzi15+JtDC8dhjus/48eMXIpymQ9Ei9I6FZ22YHe2kpCys0sr082ebaOnQQBtx
	 oe0cF2VTiglcw==
Date: Sun, 01 Jun 2025 04:56:37 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: [1st Jun 2025 Update] Activities of Singapore Government hackers inside Teo En Ming's Android (Linux) phone - 28 May 2025 Report
Message-ID: <iAOnSlW1d69Q1ctZSZNq284Fl_TLuGdkxI4Io32HkKFno1QquMhxMZDX8rcMXkuHK3EuMgf_y1CKFto5-7Xw-WiK1XHVZGyr9ZTd4M3WRpQ=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 3754d800035d0569f1890c75685d61b149cfd546
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: [1st Jun 2025 Update] Activities of Singapore Government hackers i=
nside Teo En Ming's Android (Linux) phone - 28 May 2025 Report

Good day from Singapore,

I recall 1-2 years ago, Singapore Government hackers deleted 2 selfie photo=
s I took with celebrities/artistes from my vivo V25 Pro 5G Android (Linux) =
phone. I had to restore the deleted selfie photos from the "Recently delete=
d" folder.

On 7 March 2025, Singapore Government hackers changed the name of my phone =
contact from "Michael Chen Photographer" to "Michen Chen Photographer".

Inside the WhatsApp messages that I had sent to myself, dated 3 April 2022,=
 I think "Michael Chen" was also changed to "Michen Chen" by Singapore Gove=
rnment hackers.

Then on 10 May 2025, Singapore Government hackers changed the name of my ph=
one contact from "Hairy Ted Events" to "Hairy Ted Ted Events".

I have no idea what else Singapore Government hackers have changed on my An=
droid (Linux) phone.

Yesterday 27 May 2025 Tuesday, I had visited my mother at IMH from 3.00 PM =
to 6.00 PM.

While visiting my mother at IMH, I checked through my Singtel mobile phone =
bills from April 2025 to May 2025.

To my surprise, I discovered that Singapore Government hackers had made an =
unauthorized long distance IDD 001 call from Singapore to Germany in my Apr=
il 2025 Singtel mobile phone bill.

Details of the long distance IDD 001 call are as follows:

Date: 3 April 2025
Time: 7.31 am
Country: Germany
Called No.: 4989262034700
Duration: 5.0 Min(s)
Charges: SGD$5.25

Singtel mobile phone bill ID: 000173084076

I remember 3 Apr 2025 very vividly. 3 Apr 2025 is my last day of service wi=
th SBS Transit Ltd as Network Operations Engineer/IT Infrastructure Special=
ist.

On the morning of 3 Apr 2025, Singapore Government hackers had corrupted th=
e Android (Linux) operating system on my vivo V25 Pro 5G Android (Linux) ph=
one.

In the afternoon of 3 Apr 2025 the same day, I had sent my vivo phone to Vi=
vo Service Center at International Plaza in Singapore for servicing.

Vivo Service Center technicians acknowledged that my Android (Linux) phone =
had been hacked/compromised.

They proceeded to erase/format my vivo phone and re-install the Android (Li=
nux) operating system from scratch.

Even ***AFTER*** Vivo Service Center technicians had erased/formatted my vi=
vo phone and reinstalled the Android (Linux) operating system from scratch,=
 Singapore Government hackers still managed to hack into my Android (Linux)=
 phone AGAIN, very very quickly. I think within 1-2 hours. How many times m=
ust I send my Android (Linux) phone to Vivo Service Center to reinstall the=
 Android (Linux) operating system from scratch? 10,000 times? 10 billion ti=
mes? 100 trillion times?

I do not remember making long distance IDD 001 call from Singapore to Germa=
ny on 3 Apr 2025.

I repeat.

I do not remember making long distance IDD 001 call from Singapore to Germa=
ny on 3 Apr 2025.

Hence, Singapore Government hackers must have made the unauthorized long di=
stance IDD 001 call from Singapore to Germany on 3 April 2025.

Now, I have a habit of sending WhatsApp messages to MYSELF to record inform=
ation such as what time I sleep, what time I wake up, what time I take sema=
glutide 7 mg (weight loss medication), what time I take the morning medicat=
ion, what time I take the night medication and of course various other info=
rmation I keep to myself.

Since 26 May 2025, I discovered that some WhatsApp messages that I had sent=
 to MYSELF were mysteriously missing and/or were deleted.

Needless to say, Singapore Government hackers must have deleted some of my =
WhatsApp messages.

Back dating to 26 MARCH 2025, Singapore Government hackers had sent a messa=
ge to Meta AI on my WhatsApp app on my Android (Linux) phone. The message g=
oes: "I need help finding a job".

I do not recall asking Meta AI on WhatsApp app such a message. Hence, Singa=
pore Government hackers must have sent that message without my knowledge.

Singapore Government hackers can easily hack into my Android (Linux) phone =
and maintain ABSOLUTE and TOTAL control over my Android (Linux) phone. Sing=
apore Government hackers can do practically ANYTHING inside my Android (Lin=
ux) phone, since they have UNFETTERED access to my Android (Linux) phone.

According to my notes, I bought my Vivo V25 Pro 5G Android (Linux) phone on=
 15 Sep 2023. This means that the phone battery is more than 1 year and 8 m=
onths old. For the past several months, there were rapid battery drain ever=
y day. After I could not endure it any more, I finally replaced the phone b=
attery for SGD$40 at Sim Lim Square level 1 on 21 May 2025 Wednesday. This =
is a brand new OEM phone battery. The model of the phone battery is B-W2. E=
ven after replacing the old phone battery with a brand new OEM phone batter=
y, there is still rapid battery drain. This goes to show that Singapore Gov=
ernment hackers are constantly inside my Vivo V25 Pro 5G Android (Linux) ph=
one 24x7 every day. Singapore Government hackers are monitoring and control=
ling my vivo V25 Pro 5G Android (Linux) phone 24x7 every day. Which of cour=
se explains the rapid battery drain even after I have replaced with a new o=
ne.

As of 1st June 2025, thousands of folders are missing from Internal Storage=
/Android/data and Internal Storage/Android/obb folders, according to Google=
 Files app. According to File Manager Plus app, it has no permission to acc=
ess thousands of folders inside Internal Storage/Android/data and Internal =
Storage/Android/obb folders. What have the Singapore Government hackers don=
e to my Android (Linux) phone?

I am still wondering why Android (Linux) phones are so easy for Singapore G=
overnment hackers to hack into. Why? Why? Why?

Is there any way that Linux kernel developers can improve the security of A=
ndroid (Linux) phones so that government hackers won't be able to hack into=
 Android (Linux) phones so easily? Perhaps increased collaboration with var=
ious Android phone manufacturers to improve their security?? Are there any =
good and effective security apps that I can install to block Singapore Gove=
rnment hackers on my Android (Linux) phone, so that they will never come in=
 uninvited again?

Thank you very much.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
28 May 2025 Wednesday 6.41 PM
Updated 1st June 2025 Sunday 12.55 PM



