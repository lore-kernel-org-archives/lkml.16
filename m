Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D62676C5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638792; cv=none; b=bcEMbcHrIRTeBr4yqFQ3XhM9wSt9mSplLQqTr6j90L3Ix8tp7RDnb3fin5vpDD34+V63WSfHP/vQiqb3OjIGYN7ADleL6pkoEDxrKNqJcb/RUBjzH0mL0kvanw3YWpzfTzkDyaKy8nMuOH2N+xCv0DVlSKi1vqbNwUl5Ul5MZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638792; c=relaxed/simple;
	bh=5PSPujJPG48u6PFHHlkEp3/dz5ORXJhq2E5Ljt+9HX4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hXiq3BusD/pNvpGsDb2JeQ276dybXTxz8rq/qsoRXJuMlhjS5GBAsSUc1x8W2ulUqE6haNFkQOQNBq5Ijld63pkZENmF1P3dkOk/2Kw7PzwiYrs/M0cLvCSSxWGQ1TjzGFfkSrqvUgehZEf6+EFyoQmn2R4s/IgBRehDNnEGt50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=PX90FY8z; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="PX90FY8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747638775; x=1747897975;
	bh=5PSPujJPG48u6PFHHlkEp3/dz5ORXJhq2E5Ljt+9HX4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=PX90FY8zwOSwE0Xhnqk7mDQGgAdK78VepGvYG3MmlQVk8OBswGR4sUAk/LTomFgvK
	 KkrmKXL0VUp2wmZZog9AlITJbdn/Pi5HgN/ut1WbmY9MHOq9DB7Z2qu4kdFCbrOVvg
	 gK60nxwQxoE4/r3Mnv1QkVvv2oQp3dLXHTFJ5PPTKR8bh7kH1Gi3M2jmc1QudqtZKi
	 4nV9BMvf5JNgXlwFuFrBbMSMDxqbtXapAj4HVqENtj6G6SPZGHYqS3LciRvlhDf8Kg
	 IfSG9/3zqg3MidKD79ZrzKdvrukSyuuxMsFVcgQOvVz7dIntX4MCtPMBXVQiYucjYm
	 pcJN3oD0i2IVA==
Date: Mon, 19 May 2025 07:12:51 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Apps/tools to check for damage/degradation/bad sectors to device storage in Android (Linux) phones
Message-ID: <j4CVo-8hhrBnJ7fEDZYaUYMAHrOAS1sz9TWl6AB6ocfq2RknqFAxx_o849N5hoZL9B5s64ve0tYu-GvBbsS0UZ0odJwyivHny9F81Q_nO0I=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 772ae81a9e3555b14a875364b49c5bce869cfaa4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Apps/tools to check for damage/degradation/bad sectors to device s=
torage in Android (Linux) phones

Good day from Singapore,

May I know what are the apps or tools to check for damage/degradation/bad s=
ectors to device storage in Android (Linux) phones?

I can't find any in Google Play Store.

Please advise.

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
19 May 2025 Monday 3.11 PM




