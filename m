Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33D2C9A
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738405719; cv=none; b=oCXFkmiqKIxrrep+TcoiTS+3z/rf8Pvu2gh4hl7a9vihHbylHgAGNEZQR20HwULp187PaxF+21EJxuWT4PhmtgGDFYN6XtQp4NVJqut0i34kNU8Rzx0nNMiq5E/VlfmoY32ltAQH/EDORCLZDxcpRA3TYzJMvqnYfkDdNlaJlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738405719; c=relaxed/simple;
	bh=4/G5eTpUSdUVL6Q4IBjZMpSrf+PEtQl07DvsvNuifDM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AQ/bjnOpmcBoo2B7Exl5FILGhRjP0KURx3Xrv24NskZfvkKS0PFq0Ce9mLh8Mj/ntTVoBLSAgZfRzQMByEbLHTzBnQkMAqZogV7cLlnqmJNozKl13KZ+Tj7hEqs0CxkIK5or7aBDXpeG6KUbA33/A4IzZ03vaH60Lj4w8icggno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WygzvVlz; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WygzvVlz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738405715; x=1738664915;
	bh=4/G5eTpUSdUVL6Q4IBjZMpSrf+PEtQl07DvsvNuifDM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=WygzvVlzR4+lhFR4FAmu6qhskDDrhue2EHFusuOkNdXt1Za+RCoOF7EtCkMt0/c3b
	 apLFL5tqCW0DavO15bc8UU/DVqVMW8Eu6cqhyJH3X37ov2vpwyCNX3tIq642dsPyrj
	 CIGHhgDD423K6OZEkO8fNyD5WSb7iRCSkF8iXgArvJ7Pas4C1h230Aiklh7QVR92xB
	 /vdab9eowGrNmTwIsaItAR7m2EB/JIFRc08nORvwqvcrGf7mzxyXrW7nknIl0Cq+q2
	 gzZHcuz9Dsk7sDPiHeuaceT/h5tscz/jp0pFKmA8ubZHi+Q7t9lTeVhJhqaWAH+HUM
	 fv5u3H36RPU6Q==
Date: Sat, 01 Feb 2025 10:28:29 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: 10 Gbps network cards
Message-ID: <28E_wHVmYsoTcA0hj769tOPDPwm7UNHOVSFkqbuOutrNyHx2-l1K0pf8VdZ4q0vU0iFnYX0avS-1cSDhHlHAWrqOfYpEnGEIlfO1AoU4i6Y=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: b6838f48f0a8368f58784f0094ff0ad2d780e8ff
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: 10 Gbps network cards

Good day from Singapore,

Does the Linux kernel have support for 10 Gbps network cards?

This is because 10 Gbps broadband plans are becoming more common in Singapo=
re.

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individual in Singapore
1st Feb 2025 Saturday





