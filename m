Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968B280A5C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428925; cv=none; b=Ai7+p/gHTxlAFzGFJjqzrAuKkjGUipPm3CyIcPmU0CKyuMhZr72xs4gbLdYZc0RsURDbp2QTyNuCPoqaNccoW7FH9oVZa++E65b7fAu/6FQEp4sXTbZNpNgqS57h1T9UxS2K2G3nCzFRMDL8o/r6irr09s4+ZMxORS6/Y3n7UPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428925; c=relaxed/simple;
	bh=MoI8b7oa97jRlr/sjBIV0CzffELLWWFXDnaiN5Lgkuk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yb61fZozNHhRHJPaU4TvLzAT+vvyCu3rnNlgra9SURNWO22LWqTlw7rEBNAKEsODI9Zn19auimd7IRcU+1cox6OdII1GVepHAxqRtRG/hXZmEf3S/u/6z+kX0yFmOd+uXnSD6Gt+G2ubfauek76daDXtPhkynMrJl0TWq0XxrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=i7JnFSbr; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="i7JnFSbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1748428915; x=1748688115;
	bh=MoI8b7oa97jRlr/sjBIV0CzffELLWWFXDnaiN5Lgkuk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=i7JnFSbrT4910lKctgAcXYvei7ZDrpOwig/AmBOi0sYacOYX/8ytneqmqEbd/mQTt
	 UTANYrPZRHhYhux4utjArFJaw5sqvgWufkSigOKatIxOFzEonTQbqwgKHCQJjuUopk
	 C0LWsJRjf4rJefNwSuloKaYoF7fHRaCwE196O787m/HU+oJm04U/+nTdnjnTtYdkY4
	 qGt1tLnwBnQBSYufzlcbchH2P8T+AULACfyun5p1E1f+oUJ+ySB8iLRUCOyBYuSel8
	 IL9Wx86SR4zJcb4MoPKL6LY137+XNaRpYOL+qVZ+uq9Jb0ns8ANOgB3cujFhfSmYIn
	 oUfQ5NMOg3YOg==
Date: Wed, 28 May 2025 10:41:51 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Activities of Singapore Government hackers inside Teo En Ming's Android (Linux) phone - 28 May 2025 Report
Message-ID: <YN06wepewthmtr0QpcQpEAHnm6AiBnFmwMe-3A39LskUDyCS2ZuA6ye6PKE8XTP-upuwlecQ6cZFsraRsqxNhKEvhenaJ7Ta8vLhTHhshYw=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 6973f1ebe0fd78efe58096036b95afe8f05eac15
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Activities of Singapore Government hackers inside Teo En Ming's An=
droid (Linux) phone - 28 May 2025 Report

Good day from Singapore,

I recall 1-2 years ago, Singapore Government hackers deleted 2 selfie photo=
s I took with celebrities/artistes from my vivo V25 Pro 5G Android (Linux) =
phone. I had to restore the selfie photos from the "Recently deleted" folde=
r.

On 7 March 2025, Singapore Government hackers changed the name of my phone =
contact from "Michael Chen Photographer" to "Michen Chen Photographer".

Inside the WhatsApp messages that I had sent to myself, dated 3 April 2022,=
 I think "Michael Chen" was also changed to "Michen Chen" by Singapore Gove=
rnment hackers.

Then on 10 May 2025, Singapore Government hackers changed the name of my ph=
one contact from "Hairy Ted Events" to "Hairy Ted Ted Events".

Yesterday 27 March 2025 Tuesday, I had visited my mother at IMH from 3.00 P=
M to 6.00 PM.

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

Even AFTER Vivo Service Center technicians had erased/formatted my vivo pho=
ne and reinstalled the Android (Linux) operating system from scratch, Singa=
pore Government hackers still managed to hack into my Android (Linux) phone=
 AGAIN, very very quickly. How many times must I send my Android (Linux) ph=
one to Vivo Service Center to reinstall the Android (Linux) operating syste=
m from scratch? 10,000 times? 10 billion times?

I do not remember making long distance IDD 001 call from Singapore to Germa=
ny on 3 Apr 2025.

I repeat.

I do not remember making long distance IDD 001 call from Singapore to Germa=
ny on 3 Apr 2025.

Hence, Singapore Government hackers must have made the unauthorized long di=
stance IDD 001 call from Singapore to Germany on 3 April 2025.

Now, I have a habit of sending WhatsApp messages to MYSELF to record inform=
ation such as what time I sleep, what time I wake up, what time I take sema=
glutide (weight loss medication), what time I take the morning medication, =
what time I take the night medication and of course various other informati=
on.

Since 26 May 2025, I discovered that some WhatsApp messages that I had sent=
 to MYSELF were missing and/or were deleted.

Needless to say, Singapore Government hackers must have deleted some of my =
WhatsApp messages.

On 26 MARCH 2025, Singapore Government hackers sent a message to Meta AI on=
 my WhatsApp app. The message goes: "I need help finding a job".

I do not recall asking Meta AI on WhatsApp app such a message. Hence, Singa=
pore Government hackers must have sent that message without my knowledge.

Singapore Government hackers can easily hack into my Android (Linux) phone =
and maintain ABSOLUTE and TOTAL control over my Android (Linux) phone. Sing=
apore Government hackers can do practically ANYTHING inside my Android (Lin=
ux) phone, since my have UNFETTERED access to my Android (Linux) phone.

I am still wondering why Android (Linux) phones are so easy for Singapore G=
overnment hackers to hack into. Why? Why? Why?

Is there any way that Linux kernel developers can improve the security of A=
ndroid (Linux) phones so that government hackers won't be able to hack into=
 Android (Linux) phones so easily? Increased collaboration with various And=
roid phone manufacturers to improve their security??

Thank you very much.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
28 May 2025 Wednesday 6.41 PM



