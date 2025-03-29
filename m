Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22EB339A1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258539; cv=none; b=f7wn3zAdY+VWpqF//lqIgYiDqCI4aqXbviYKvlYQHOs853DikAUxTKx2ycoUWqcWb1H2njflyh5uJ+vZy0jVRPjAc+DH+Za3jsly07J4O5xPIJj4zwynExy3Jwr5PF7i7wPae4NqP2cqWfX6BfubC8PzzpTEUPhWDPFkMYydKpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258539; c=relaxed/simple;
	bh=ZUCIdstp/9+yoiIJqBaczvVftYLxI5cBRthS68Zx1dg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TdLXBgK3LYtcEiFbxiAKVQ+P8acR1ZtLyvPPxACk/F6s25OHpaozAx/wKvQ2RgmJjBMVQku31IQTlOItvdI6qxvtcJW9zkWSj1nybQbxH/XfeJVonA+JhH32/JjrokFwbKO0RuH9yXjXpOI3H8A62gE8dvf0pkOX5Xv7zER2tC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DZ+dzXmp; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DZ+dzXmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1743258527; x=1743517727;
	bh=ZUCIdstp/9+yoiIJqBaczvVftYLxI5cBRthS68Zx1dg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DZ+dzXmpQrKNJ4V7cT0hE1aS1zaws72no7xnNgJ98BXerVeBZmBg82+wGK+0IicLO
	 Te02VzcRuNgWEMt6Sq99isUs1uY4/PN1kUrUBLe2Yqug0UItx19kxQ+8N8hGNRXhp7
	 FKGwENnAwMzBbr8smAtGYJ7wsgzZq4AVktxw9pyfHbjiV+m4fEXtcgoTp5G2sOqUGA
	 RuX9hxgdRrmXNC6KkvE/OO+WxoQnSI7qE+YgeQD8owYiqxtaoS7aeDxMa9I5gACozM
	 JDu5hJPauE85cVJvPtJrIeOAikD1kMfTKZShpV9i/QRQPsbfag0NIq3KY5HKAbE2Ej
	 rBInyOa7WS7Iw==
Date: Sat, 29 Mar 2025 14:28:43 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Singapore Government hackers have absolute control over Teo En Ming's Android/Linux/BSD/Windows devices and equipment and online internet accounts for the past 18 years
Message-ID: <r3Q2mK45W31Ois3BVJcMDeHxJ3q_6z7VmHdIc-KJTMihwS7u2RIYXJ6_WML6x-S3JqP-sJcGCPn9mpiszUnC48F80TaIMe3RBPmP-wwHpg8=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 24d11bd26edd3989b2cb9f3623a8442ddc487a91
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Singapore Government hackers have absolute control over Teo En Min=
g's Android/Linux/BSD/Windows devices and equipment and online internet acc=
ounts for the past 18 years

For Immediate World Wide Release
29 March 2025 Saturday

Good day from Singapore,

Singapore Government hackers have absolute control over Mr. Turritopsis Doh=
rnii Teo En Ming's Android/Linux/BSD/Windows smart phones, laptops, desktop=
 computers, servers, firewalls, routers, network switches, PBX, etc etc (co=
llectively known as "devices and equipment") and online internet accounts f=
or the past 18 years or more.

Singapore Government hackers have very persistently hacked into my devices =
and equipment and online internet accounts and doing whatever they want for=
 the past 18 years or more.

Do Android/Linux/BSD/Windows and all the other operating systems in the wor=
ld have Backdoors for governments in every country to come in uninvited?

Singapore Government hackers also have absolute control over my online inte=
rnet accounts. Is it because the Singapore Government is using Government M=
ind Control Technology (GMCT) and V2K to read my mind and thoughts without =
my permission, and hence the Singapore Government is able to know all of my=
 passwords by mind reading?

Dear Singapore Government, please stop hacking into, stop controlling, and =
stop doing whatever you want in my devices and equipment and online interne=
t accounts. You are encroaching on and violating my human rights. I am gett=
ing extremely fed up already.

I tried to file lawsuits against the Singapore Government repeatedly at var=
ious and numerous International Law Courts more than 10 years ago but the c=
ourts say they have no jurisdiction. What can I do?

Thank you very march.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems





