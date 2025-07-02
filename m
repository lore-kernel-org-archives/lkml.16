Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942C23ED5B;
	Wed,  2 Jul 2025 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492499; cv=none; b=V+Bv6DFfOO8nl6Z0M+nEt33IEnLByFOyoVWrdp746KgvUZkhWvjgADN41R63FxA3HQinRPBQtK0JHNx6cFxutnkBAFoE++1WlmR7IDs0+7eDY+YG9E78ufnlZ+Pf9glanseukyXcXFJsTOSOnMrY5oaTmyM7TedhYgxkRFweunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492499; c=relaxed/simple;
	bh=UoHy6Aahnj3DqsTAIhcEdtokW/qWpOyjEzESnt8Bfz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKRT4qcseKUW324q4UpUqIA0wn4PE2Z46l+8+4EztUJfH8sCDwK5nWyAkN7+U6U6BqIIuKneFJz+NuUm7jHK+YBv0/+8HCX11B1uD2ZvNLl04uXC4jQ/gCQqpTqtQTihxw04VWc/cU0SoP4mljw4AngwU/+D/d4yY5FKJbujqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcpU3sTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcpU3sTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4A2C4CEE7;
	Wed,  2 Jul 2025 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751492497;
	bh=UoHy6Aahnj3DqsTAIhcEdtokW/qWpOyjEzESnt8Bfz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcpU3sTPyl05mGn/7w01cXw+NulGVZDapb5sDP6q5Kt1HXOM4d0/JEn9s7VW985wg
	 dwE1IwYwaKV+cKw2+H69RJEBHfIv+yfLv8SHcVKGTvb+LigXcDxhpZLIUrU3Qxp3AN
	 fV4Z6QmHI+tyAB+4pzkkpJB8qTlwmcwHqkGGEfcGXhbQYYKrJSNLssxX8+ghKxALc0
	 lue2ZH/MMvP1uNxY9qCkiWdhtwV4gLi24P87xxs3CUfFpyTq2cx7VfAgmycngpMoFz
	 cceXbuyW/l1FHKTdQvkmJ4lpD8yV1E9AZ6j6qi13XPRW84wyJJ7ffDLjyFV/2fwaIX
	 dn/uhzOk6irxA==
Date: Wed, 2 Jul 2025 14:41:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Quentin Monnet <qmo@kernel.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] tools/build: Fix s390(x) cross-compilation with
 clang
Message-ID: <20250702214133.GB2103156@ax162>
References: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>

On Fri, Jun 20, 2025 at 01:00:26PM +0200, Thomas Weißschuh wrote:
> The heuristic to derive a clang target triple from a GCC one does not work
> for s390. GCC uses "s390-linux" while clang expects "s390x-linux" or
> "powerz-linux".

This generally seems fine to me but I do not interact with tools/ much.

> There doesn't seem to be a formal maintainer for this file.
> Maybe the clang/llvm maintainers can pick it up.

I do not have a tree nor do I send pull requests to Linus. Perhaps you
could just pick this up in the nolibc tree or have Shuah take it as a
greater kselftests update?

Cheers,
Nathan
