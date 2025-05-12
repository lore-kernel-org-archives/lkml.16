Received: from mail.aparecida.go.gov.br (mail.aparecida.go.gov.br [191.222.184.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2511B134AC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=191.222.184.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041554; cv=none; b=M0Oz6RDe1G880CCIlN/wXP2ndyIIW5OJIF2Of7jetCjfQEgy1HwEK1G8LMWN/3qm9k180hsUNiOOMRw1NHVdkp+6PXo+KXFoISdvcFV/pvA+oyecctqp78POdcynI3gRFZPXZ8xB7OIZHuDumzEetx5ll81IWN1N2Mj4tFsr4Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041554; c=relaxed/simple;
	bh=ifqe93bWW7NB+h2TBef/9+FHgSnJ2rp3RC2sDlIhwOY=;
	h=Content-Type:MIME-Version:To:From:Subject:Message-Id:Date; b=gh21BA43qU9omswL9UBrtuPWNLcmGfHkw1Nbdr86nkGyaHw8j7kuGm7Y7auJItTjMPP0T92dRcMKMtLtvl9HDrFRgvXWHfg74vpAvWjkl96krgZHrtoAY2CeqUFSzJTKZn+S0/TAkmBZgP2a5DwZ50N62G3RbdYgh84uypSrVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aparecida.go.gov.br; spf=pass smtp.mailfrom=aparecida.go.gov.br; dkim=pass (2048-bit key) header.d=aparecida.go.gov.br header.i=@aparecida.go.gov.br header.b=OTBeX+dI; arc=none smtp.client-ip=191.222.184.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aparecida.go.gov.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aparecida.go.gov.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aparecida.go.gov.br header.i=@aparecida.go.gov.br header.b="OTBeX+dI"
Received: from localhost (localhost [127.0.0.1])
	by mail.aparecida.go.gov.br (Postfix) with ESMTP id 989DF23D21933
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:09:45 -0300 (-03)
Received: from mail.aparecida.go.gov.br ([127.0.0.1])
 by localhost (mail.aparecida.go.gov.br [127.0.0.1]) (amavis, port 10032)
 with ESMTP id CAJYXRRs1ObF for <linux-kernel@vger.kernel.org>;
 Mon, 12 May 2025 06:09:45 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
	by mail.aparecida.go.gov.br (Postfix) with ESMTP id 1953420724B25
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:09:45 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.aparecida.go.gov.br 1953420724B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aparecida.go.gov.br;
	s=83049786-2A36-11EE-A10D-0A99322757AD; t=1747040985;
	bh=ifqe93bWW7NB+h2TBef/9+FHgSnJ2rp3RC2sDlIhwOY=;
	h=MIME-Version:To:From:Message-Id:Date;
	b=OTBeX+dIZqJY6E60hGHH8P15seMwFtAn7NBvhikqKwHCRPbO5jd0YgaO4h8yTVn5c
	 i8egq3kQFADBOznpbFtPTtYbv69YaMpy0Z7/+5Sj9vc3Aba4y1Cr+pKTk7vMP1930b
	 kcaPE4ktLm+czX+ThxevXz8aq52s6POf/lD2qC3HRpuOhPfqR70TxJ9s+TwSX0InNU
	 YacIMBVVeOoPyNOo7i74VHTeiIgW4Up6g5lL1oi6rYh/ZmyFVM4/fGgN5OXOCaO+9w
	 Ma/0USE5lML8HijQzEzLtVvMmNsHsmVwggTuRShGVraB1/wZQP6q/qwkW6e1BBW+yR
	 JRWl27MBFihBQ==
X-Virus-Scanned: amavis at aparecida.go.gov.br
Received: from mail.aparecida.go.gov.br ([127.0.0.1])
 by localhost (mail.aparecida.go.gov.br [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yIojzo1BDtDu for <linux-kernel@vger.kernel.org>;
 Mon, 12 May 2025 06:09:45 -0300 (-03)
Received: from [127.0.0.1] (unknown [62.60.239.155])
	by mail.aparecida.go.gov.br (Postfix) with ESMTPSA id 7DC6D23D21933
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:09:44 -0300 (-03)
Reply-To: b_ellis@meilookv.com
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev75
X-Originating-Client: open-xchange-appsuite
X-OX-Marker: f83629b2-24bc-446f-acd4-3aa376d19cae
Content-Type: multipart/mixed; boundary="===============4545382915492903781=="
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "antonio.netto@aparecida.go.gov.br" <antonio.netto@aparecida.go.gov.br>
Subject: Request for Clarification on Unknown Charge
Message-Id: <20250512090944.7DC6D23D21933@mail.aparecida.go.gov.br>
Date: Mon, 12 May 2025 06:09:44 -0300 (-03)

--===============4545382915492903781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hola,

I just saw that I was charged two times for my recent transaction on your online store.

Transaction is listed repeated on my payment history, and I want to request a reversal for the duplicate transaction.

Please investigate this and correct the problem soonest possible time? I would be grateful for an update as fast as possible.

Thank you for your assistance in advance. Hoping for your response.

With appreciation,
Bennett Ellis
--===============4545382915492903781==--
