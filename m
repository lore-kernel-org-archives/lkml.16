Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA881ACA;
	Thu,  1 May 2025 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117027; cv=none; b=K0mxBCr86oe99TWkidqsROAIlsXr9DWAU4EKZkMtsDvLL5OcKbhpLx4VqgH/SZR+t16f8319SqFR4PPK1Zeyp6GWiMFPe3gudIlGj2PNrZRd1Aeb13QJX1ZNSrVsYWUuWR57s/cFr0OVtaAeTGKhLrIWkfM7AluIDKoqblNrTnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117027; c=relaxed/simple;
	bh=V9OJ+gty3Q+XpdbCmIYmJS5z8jsP1u2Ixn/zet+/qV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBA8QuvIOU1XtPKb75/wi9W2sr8JzZRzYVuTQWRLNVcedubJUNBTCO4TuQXg7EfWX029YU6F932ipF5qljcmxfEfNDlfDBgNRuEzhVbjWNlSE6DjdirIfpKU6qAyDNbE2MtmYX8K78eBU+qLDYljDoHuCH+YTspvoz3iiymIj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tm8BMc+A; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tm8BMc+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746117016;
	bh=V9OJ+gty3Q+XpdbCmIYmJS5z8jsP1u2Ixn/zet+/qV0=;
	h=Date:From:To:Cc:Subject:From;
	b=tm8BMc+AsuhyyAdVX1reoVxmarTQirBjuIZ/kUvwLD1ySg/1exdcNm5vO2wEDUWeR
	 pIQ866eNH3NsyAvnt6TA8UYsrpzPyIy82x80yeXXToSOtG9Vj9X0UVOJ5xV9GHA+/p
	 AjB9+XGoUnG8jjsOufWO41lWaneTXsy6oi5JQr/0=
Date: Thu, 1 May 2025 18:30:14 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: linux-next: Addition of the nolibc tree
Message-ID: <6d906909-99ae-4934-901b-983ad7d3cbda@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

could you add the nolibc tree to linux-next?
git://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git#for-next

It replaces the nolibc tree from Shuah.
git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git#nolibc


Thanks,
Thomas
