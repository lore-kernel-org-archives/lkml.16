Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667B77485;
	Mon,  2 Jun 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748866745; cv=none; b=kB3UZIbak4t7KGzBJ9S4NI48hQKjSw/lpjLJw++CDgl2S5coKijQCeU1W2BcMFvyJwV9uFtZoYCN1VFVYBow7qgbWmj213wRSApf6WV0mB/57m+vRNGbaj6iLjsyheDTLp9fmNvdh8aho9ZcwPuD2i9ysV+atyWdV8qkCieqRDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748866745; c=relaxed/simple;
	bh=4HLmLTMARyB7KtbrHmZBJRg4FNgQ4KLk9AMW9sOYazA=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=Yg+wjpoWI3ODNA6bOs7Vtf2yTXsTbWTGWJFwMBelUlUyOAxr1Mk3TiatzubWc31woR5mgYX40PCA5OaLh2T/xpKx7GbpulWQ6jIl2zz08jtQ6oGM7KdpiZXCvPUTm9bXU5CqCSedaZuubDUXxvUKvFd10QUp+eGDvEa3yMGmBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=JA5Jigpd; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="JA5Jigpd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	Subject:Cc:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=MtFBjO8nI0ag1cv5f0yZXu05Kzu7DXddOKwGEQm7YZc=; b=JA5JigpdjnLZG0yt9qv3FWLqi4
	LpMeG2I+WDQGQ3kiTCHj1tVKpD6iipG8nr1v5toHTklPUqYH+OYm3EsUrqnrmY/Er6L3KklUxmjXv
	zhYbLPQXKpgH9fpdeqxPXV11/gv30/olr4cwGhIC+aYj+nkfNaZzxgcML81NDAqso3d8gpgtE7Abz
	4hBqsV5xU4KputARibgGEPt8jRQMk3bNnIRl18y0QUn8KrMt2RSg0aIFS4GhKUFXKYyIq91WY4jfr
	XJW+rrhyPwveEcq9JYzbySofRplc8zsoIq4Iij/zOuJNIPvIbj2KGTwvwT03zhdPtAmv/sHm3NpaJ
	lFyZWVIw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1uM47w-000GCU-3C;
	Mon, 02 Jun 2025 14:18:53 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1uM47w-000ILr-1E;
	Mon, 02 Jun 2025 14:18:52 +0200
Message-ID: <d3876ed6-669f-4647-a742-0aae59989e0f@computerix.info>
Date: Mon, 2 Jun 2025 14:18:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
From: Klaus Kusche <klaus.kusche@computerix.info>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: 6.15.0: objtool "unexpected end of section" errors with clang 20.1.5,
 and lto
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: klaus.kusche@computerix.info
X-Virus-Scanned: Clear (ClamAV 1.0.7/27656/Mon Jun  2 10:34:16 2025)


Sorry, resending my message dated 2025-05-29, no idea why 
that message was appended to a 5 month old dead thread
instead of starting a new thread...


Hello,

Compiling 6.15.0 with clang 20.1.5 and full lto, 
I got several error messages "unexpected end of section".

See https://bugzilla.kernel.org/show_bug.cgi?id=220174

(kernel .config attached to bugzilla bug)

Klaus Kusche

