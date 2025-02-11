Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC82255E38
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292241; cv=none; b=cvGHlOECAxUjWhPmx5B4iaidwra9wKWYrl8wq03viGEWk24/P74Mu386cwS3cOYLX0shGY3xDr890CCvjTyUC0EJ6RPxIjpVDC9gYgLLhER/Gyw8zX9pBsdE8+sffCH5V06pOVbLb653vZI02o/VAE+jEgytwHgZWs1FI6ambx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292241; c=relaxed/simple;
	bh=EZ+pF8wYkIw3ZU2WVTb3J3A/xLk8c97MaHprNhum7k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6iOxwv11Q8Yf5tGHmzF+Pm0YFiuZFcq2aV8BcOrmEV7NreRl4fVnr3KZtu0oQMG5K2Pv+5iQy1OZK8Zfd0cY3RdyZORa315qVj5zXcbjU8EmeRvASF+tqwbcqZkGftRGAIw8V5QRaUfTmkwEyLwZyRzXxqh5fd9XtKrhqHbwwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEYYgZej; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEYYgZej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D98CC4CEDD;
	Tue, 11 Feb 2025 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739292240;
	bh=EZ+pF8wYkIw3ZU2WVTb3J3A/xLk8c97MaHprNhum7k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEYYgZejvHZgnAyaL1WvU+jPD7/0eVJPWHCJEut7cMn9QiPCLjuS/saI80Zptnz4l
	 HhK/sZo2QKy6kc6XAuspvH+sq9TrfLAHBYUco41TpJVlisv7Ho0U7yCWlMp1b1ChMk
	 v7wDaka1Zm/oWsykp0lpgGyGeQZbPK+vTIFhpzklvpGzQjbnY4SUH9K2zYRzyrVBzI
	 vmhiy+ddblQiAM0OP6zcW4Mw5Zqp9nX/0iBM2QJZG7WiLZIW5tNhSFxFPubK4k9uHK
	 E4HX/4VJDMUU2VoYidl0vIw+7caNcjtBBCrAzI4Sq4WdyC0eX/RTXAHQLs0RIKZVvl
	 SZhCpq889UDAA==
Date: Tue, 11 Feb 2025 08:43:55 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/35] Documentation/x86: Document the new attack
 vector controls
Message-ID: <20250211164355.abxlbqhm3gym2e7b@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-20-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-20-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:59PM -0600, David Kaplan wrote:
> +Cross-Thread
> +^^^^^^^^^^^^
> +
> +The cross-thread attack vector involves a malicious userspace program or
> +malicious VM either observing or attempting to influence the behavior of code
> +running on the SMT sibling thread in order to exfiltrate data.
> +
> +Many cross-thread attacks can only be mitigated if SMT is disabled, which will
> +result in reduced CPU core count and reduced performance.  Enabling mitigations
> +for the cross-thread attack vector may result in SMT being disabled, depending
> +on the CPU vulnerabilities detected.
> +
> +*mitigate_cross_thread defaults to 'off'*

How does STIBP fit into this?  It's a cross-thread mitigation, but it's
much cheaper than, say, disabling SMT.

The default is generally to enable STIBP where applicable, but *not* to
disable SMT.

-- 
Josh
