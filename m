Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E59204594
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593370; cv=none; b=hx3FhmrPNJM7FWIDGfyHmvspijPjjADNJwcKXs9ZQC1aDykqUNuYJ2ELnvZa6yzRMedpsZwuhAPdR23PVLF2xb7jp0YyAntwBsu75E1E+spysz1pz07KJTosxMm2ftULrjBNr7pD1W6yC2L7Sz28YHhYgyUmyaldC3KBBtfXocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593370; c=relaxed/simple;
	bh=uQGnDZvNlOSYaJMnzmUl/VkY1e3P+XpR41sfligojkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDL31VmuSive7hiV9EJ6ufemGwEjavcSyXf8+dOlz9tqPxI4ej6WPO2qM8az3t5aAVIVNmzKAPTgOV7Eo6ppI2xVcQ4PORNgIPj3zcxWbWK4QahMLW5aRBTmQd4ntAHAnXLFQTvGgfn4ndyHrFmv8lk/BwU4BGfO4hihChosG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UztLKPmP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UztLKPmP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uQGnDZvNlOSYaJMnzmUl/VkY1e3P+XpR41sfligojkc=; b=UztLKPmP5f+BNnojH42k45Z6FW
	OPsyC1NeGwgoRUUoofnoinb99JNNnmOr7boqCa1QSwrw06Dyj3Tf1bY5Px45cigaKJjmFsC87r/7Z
	4SZer2jL+PRYrsQzg6mhzyMiN/3TaUGp2DqZcClekD4sHVZ7RjtZZ7GBToO+GXnYUEFxcmekGALqM
	qWSJ+IRovEc/XQ9raIiD0LgGNldlLJvfpXFykb52pfU6OYsy/IcktGTMyl1EZMMUTUiyyWkg6PqK4
	lxZUiWS5Ktf4J/SHzfDQR332Ax9kJHXleBtkZkcYhIvxyYlG/tbj9Gko+3dXzVWkYHRLO8qToUzNT
	6xs77fVg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1texYQ-0000000G6DA-3ntV;
	Mon, 03 Feb 2025 14:36:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 54BEE300310; Mon,  3 Feb 2025 15:36:02 +0100 (CET)
Date: Mon, 3 Feb 2025 15:36:02 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 04/15] futex: Allow automatic allocation of process
 wide futex hash.
Message-ID: <20250203143602.GK7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-5-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-5-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:24PM +0100, Sebastian Andrzej Siewior wrote:
> Allocate a default futex hash if a task forks its first thread.

This makes it so that private futexes are *always* on the mm local hash;
there is no way to disable this.

This seems somewhat extreme.
