Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469651D7984;
	Wed, 30 Apr 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032028; cv=none; b=Ju7NK0boN7M+Fll/TsCZtyosDG7ogtWdhC9Aqo74ykQw9+DaHHDg+8vGGWN1T1+qxs+qCD0dJ9MAmHk5hdVPwHiGwxpR/xb38s7egcGOGZ995+hMyb0O78sWqAXh9M/1BjGjahiS8/kBkHPMrnF7rihO6JOYBKIj1p7GE9kYfBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032028; c=relaxed/simple;
	bh=PBW9qoJ4Lb5vXow2epI/sYKVUsMysVFGCILTlbl0NMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8QnYHFD07YR2eo9H8aZnEQi0DbyqgpMCsLWmxmlulwW0CNkgGqIETHidczc+Kr0G6UxQ94VU80/m4+wv2pO4kxjKuv3mByHJla07vlX/qXbNT0PhS5Klb+HV9VdOib4f4mr003NhmS1MJnbTJzVvAzBCVgCRJOkrMuHKwnoNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh2OBl9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh2OBl9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3265C4CEEB;
	Wed, 30 Apr 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746032027;
	bh=PBW9qoJ4Lb5vXow2epI/sYKVUsMysVFGCILTlbl0NMU=;
	h=Date:From:To:Cc:Subject:From;
	b=bh2OBl9iv+Q9hruxW07rq+hYT+VecXnTS9B+PgBEoRFUQP5cgLATGtWCYbirEENMu
	 oxEhZQxVefuKnzReyc0d/TsvD8hYNvUxVwzIyQoarAZTXUUFP8avuTxxvhPUrz0VN8
	 uWCeQlZoJZ0Cp+Yajk4kH6OrRqCxCLA/vMgIuN8DOc51uPBzpIdICd68W4ZxCwdOQc
	 VeolQhTnUiqoX9Pl9JLWFi3EldRRBQJT+DEkyZRnrHx7Mf8OQUn5nIUElHZUAM4QBK
	 RRBpxhN00E1u5Nf5d8w5xaG1yLOwmXko+Q8gFnJbsK0H/QsZf3ojUgcNr29BQ+ifg9
	 AlR+2SYAHZeHw==
Date: Wed, 30 Apr 2025 09:53:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.4 uploaded
Message-ID: <20250430165343.GA1436080@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.4 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 20.x
series is no longer supported.

Cheers,
Nathan
