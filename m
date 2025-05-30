Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A31D9A49
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593825; cv=none; b=tPtRm0Mmye2AVDcOVx+hzmkFMpXgdNsxZ28gjAsWZ+ZGSqHUKZ2gOwnoVgcNOi4M6qAtHM9kWTCyqrseAdlmbsna+kQfl7t+SO1WZZhG7XZ/ut75HnQken07gUzXXCV6xnWUW+105SxYpdrvb+BdKVaue2g/qrnr8Iq8IqwtUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593825; c=relaxed/simple;
	bh=uMvsKY9QEjvjwd7DFYGmn8OEokhLWAsX8TBQZAs4xdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/3wuz+T/pQ6r7Prwn6LHuX2xyf9M56Vuf8F4fDKgdQId/eSWb+KCiTlsPBzB67Fja8PTeUM7eRY4rjo4ljk+p335AToJEOWg1m9/NtWSxiC0/cMnvwA7qjEC9F20Z93Pb5N1KX2DFeDr/qV0Xx95GenTOuGJ61vw39Xsb19P7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=M35habH1; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="M35habH1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ls5MxaQepdo75i1874VZ8q0kWhIBVLloFn5NFQ+OlgA=; b=M35habH17koqH6T88PnFN9kRZ0
	MGZvi5QaNzB22SaHZ5mBAUawPgO3ZlhsMAl7+UgnWSD85VKYCTi7MNEXcMA0/HRYukkGn+WNvXhsE
	oi079+hTHAZuoiYLd5TDY2V405SpZUU2IUXAYeEFcysZSwjcUqkAw1ZDcwlC9splmw4UeHCOBrTO1
	n+J9vfLDvlR4RNrriFue2AGQLQBOHuGb3pI9lOgegp7Nvb/Omly6Ui7oF3Tk6mdIGQGx0dqFus/z3
	OksHFTkUc+cvyJ+rmR7QBv+bXsAKQfI30sOLxI2tVKsvshPpe2tG8VnH+PLCKqNzdt8pUgmrAgWOM
	HQGTixBg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uKv7z-009joo-16;
	Fri, 30 May 2025 16:30:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 May 2025 16:30:11 +0800
Date: Fri, 30 May 2025 16:30:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrei Vagin <avagin@gmail.com>, Dmitry Safonov <dima@arista.com>
Subject: [PATCH] time_namespace.h: Add struct seq_file forward declaration
Message-ID: <aDlskzKIAULMlwPj@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add forward declaration of struct seq_file before using it in
function prototype.

Fixes: 04a8682a71be ("fs/proc: Introduce /proc/pid/timens_offsets")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index 0b8b32bf0655..bb2c52f4fc94 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -12,6 +12,7 @@
 struct user_namespace;
 extern struct user_namespace init_user_ns;
 
+struct seq_file;
 struct vm_area_struct;
 
 struct timens_offsets {
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
