Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA671FF7B3;
	Wed, 18 Jun 2025 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229992; cv=none; b=cM6BAVpdsLxOpCdWhvS+4OJbGxzcCnT9QZyb1jWB4UAO7dT+dMTBZCu30uhYQF+8oUf5fk71GeBNpBc8XMNRy7HgaQiASYMJWYYuUEEoglb4ud23kKPu9gh9RpTbyHMSeuYwHZgNRAt196LX7oXBl5MHydjX3PN0rtM+mCDKSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229992; c=relaxed/simple;
	bh=OhHcdfVoijsiepONmPCsYtD9gB53gFZoE4YRYNkxUbU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRE1mJGEHE+djtxoiJjiHYBcV1LlnikoKb+/BGqkBq4mji1pl72gxBtm6PQ4SHTLhVkM6o9B8pxqyzrcS6mbk3rZ0z9OvBijLG1CeGis1O+NsoJ97y3Ua3y3YQaOqYHoSN+kpbc+H22McM1fHcVuGf4RKLXJa1BhBfF/CYiNVXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDHLaRNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDHLaRNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC6BC4CEE7;
	Wed, 18 Jun 2025 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750229991;
	bh=OhHcdfVoijsiepONmPCsYtD9gB53gFZoE4YRYNkxUbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MDHLaRNyUKCEWaqBYJKIhN5Z4nDFPqaVzVNvBpj3xBafcsT1z7+Tv552hXQgjKkDg
	 XK1gyAQH0jvVP2Nefwi6Oog9YzxB8T8d8goxyyn1JjzfCpsPeztmgGtdNhidioySVV
	 5Ox+948AlMrY22nGOjYpDim2s+1SuntGDJzuZbqTc193zZmmt5LotnPkgO5U18JwYq
	 W9MYRz52PINXfUqALl2ibprDN2Mwo3C5DlPjdq/7oVZSGb+y7eTl4lYk8iR9sURWSd
	 Z41ly2bjhcTy/5MJG/cLPhvqvogiBY64gnPXoAiF8WMd3upwpNg2Y4IWX/A1nupWYP
	 H3gqayExhZoxg==
Date: Wed, 18 Jun 2025 08:59:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, "Akira Yokosawa" <akiyks@gmail.com>, "Breno Leitao"
 <leitao@debian.org>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>, "Jan Stancek" <jstancek@redhat.com>, "Marco Elver"
 <elver@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Ruben Wauters"
 <rubenru09@aol.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev, netdev@vger.kernel.org,
 peterz@infradead.org, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 01/15] docs: conf.py: properly handle include and
 exclude patterns
Message-ID: <20250618085945.2876f6a1@foz.lan>
In-Reply-To: <m21prilkkx.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<cca10f879998c8f0ea78658bf9eabf94beb0af2b.1750146719.git.mchehab+huawei@kernel.org>
	<m21prilkkx.fsf@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 17 Jun 2025 11:38:06 +0100
Donald Hunter <donald.hunter@gmail.com> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > When one does:
> > 	make SPHINXDIRS="foo" htmldocs
> >
> > All patterns would be relative to Documentation/foo, which
> > causes the include/exclude patterns like:
> >
> > 	include_patterns = [
> > 		...
> > 		f'foo/*.{ext}',
> > 	]
> >
> > to break. This is not what it is expected. Address it by
> > adding a logic to dynamically adjust the pattern when
> > SPHINXDIRS is used.
> >
> > That allows adding parsers for other file types.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

Thanks for reviewing. At the next version, I'm placing some backward
compatible code for Sphinx 5.1, based on Akira's feedback.

As the basic logic is the same, I'm keeping your review there.


Thanks,
Mauro
