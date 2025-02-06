Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61910F2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849038; cv=none; b=N/asmG44Xvh7zO7mLI1ujeNEYAelZeGOGTfr+00DOAg55IbbgRwqV0TbOIWvmZWO4dIO+N/DzdlgZd7KOUrPQZIhwjjgCAs5LlECoqrZcMik/CspsSqWgbuLmzM5IJH/NlC/extebEEJbtpUmOgZwLfuBrBqiySnUW9yHgD+YPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849038; c=relaxed/simple;
	bh=JeoPWRYSsCtlMc9oGmC8rZWn7AV4vxUYVEPc8Mjztfo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TUtZECU1v8PWhLVtIeQJYKR+SI/C9JBf9phwuVb4j/+IkiwgB0F4TNmFg3Sz4Q5hEclZc0kQyck0b927kOXLGicBn8/UtgQ0tGtbmulRd/r9Sck59NZAKK9xbh81x6EfIqE4dWHnVFoFd446sRH2jr9bRdGYQzv+ct1TiM8doVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=yFW9V0fs; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="yFW9V0fs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738849027; x=1739108227;
	bh=JeoPWRYSsCtlMc9oGmC8rZWn7AV4vxUYVEPc8Mjztfo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=yFW9V0fsApW8vbPGI/2NV/lF1z6a9LTJ+UmMmhWu0Aozs3rrmG2YL8xAVtKJpjlFt
	 CETQbSogN5DxImEBM/OphHod1BmZhTRladENgh3e7xrLtgvTtmvaIoIuod7m+rlgZH
	 w5Nm+KP9gxqel9j8O53Qd1+OEBd1S8vfLyn7iykj50OppfXhzzllPrI75WR81OWeFd
	 /DMf8lanklMjQ4uCeDN3/Qpe2Lu78v604/0XIyhPF3HKQAxsVlTht5tR5JJ3sHpu/o
	 E5Y98pJ6ENub7WHv3dYUbQ2QABFcPhXBUNcD3CGz7QS9/lwcHG8Hr+OtWu9J6LPu8s
	 MhlPEALcb4A8g==
Date: Thu, 06 Feb 2025 13:37:01 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Why can't I update my Android phone to the latest Linux Kernel 6.13.1?
Message-ID: <dygRUEDz4LGT9qYwYL8tnMEQ7rAAyTcITo8Zs2jtdDwvzofdBF9jRMVqh9UZ-wSGpc4-aPJoZLrD5lM4v7wc2TQwHsCmi7dqlYmaN0_VdWk=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 65e2c54863dcc3f44a837e8d7a4f69f016a061db
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Why can't I update my Android phone to the latest Linux Kernel 6.1=
3.1?

Good day from Singapore,

Even though I have updated my vivo V25 Pro 5G Android phone to the latest s=
oftware update, the installed Linux Kernel is still 4.19.191+ #1 Tue Jan 7 =
15:54:16 CST 2025 (Compile time: Jan 7, 2025 15:46:52).

Why can't I update my Android phone to the latest Linux Kernel 6.13.1?

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
6 Feb 2025 Thursday





