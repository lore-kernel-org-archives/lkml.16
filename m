Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197C72601
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405566; cv=none; b=FrG0GGgz9v/UmoG5e577qf4/PMRAcU0X0pzOw0yn+Nu+ZGLGmG28EqUbVLELs7KyXwTmuWknNqZZPlBIvB90o7dE2JdujO967AeQmZY5c89FBRqI5zPxz0/qJ/mN01yGiAH7otDTc7NQlr54LiRpaymr616I1rxEjRT2f5N6n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405566; c=relaxed/simple;
	bh=tHofUx9bTwpHmb+Zpkg0R90p/JL1R36qcc5bKk4Q3ww=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oR3NCQUhXruBVxew2Qcq9oUG6yx3kYB/U0FL6o05+/AxBaGN+Tq2EJe1yR8DmQn5vlNQ44vIx0nfmYenuV4KZMuFephhZzdF+ub5WcYru9Dbxa6dN+LhS/iIE37qHaz2CMckCFVZB/4Z9RkLEaT5HLRhIqJ+FCmm150iKzPJDwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CEIM4AnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CEIM4AnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21905C4CEEB;
	Tue,  1 Jul 2025 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751405566;
	bh=tHofUx9bTwpHmb+Zpkg0R90p/JL1R36qcc5bKk4Q3ww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CEIM4AnP85zEAKs1pfZ7h5ofu6yEgYwzM1NPdaup3olCG8VKtygPuYtMPdhuOOgIH
	 +dW7BypSA5BPAfL957Cfu3UDRbB2dl2alxgFb5lD3JSMDtqaxfX9ZG6RqVFAxk8LH2
	 guaEqyygbJtGQzi2qTCl1NHcB1CiBNdK5iXDYxmk=
Date: Tue, 1 Jul 2025 14:32:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Christoph Berg <cb@df7cb.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: mm: Added modern version of shell quote and a
 stranza for required command check
Message-Id: <20250701143245.771205665a349b02929e9290@linux-foundation.org>
In-Reply-To: <aGPEPxNkvtK3xRgk@Gentoo>
References: <20250701094603.23933-1-unixbhaskar@gmail.com>
	<aGO_Ddv1ALTejqK2@msg.df7cb.de>
	<aGPEPxNkvtK3xRgk@Gentoo>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Jul 2025 16:49:27 +0530 Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:

> On 12:57 Tue 01 Jul 2025, Christoph Berg wrote:
> >> -gnuplot -p << EOF
> >> +$(command -v gnuplot) -p << EOF
> >
> >Why would you delegate PATH searching to `command -v` when you can
> >just invoke the command directly?
> >
> 
> Because, for the two reasons,
> 
> One posix compliant behavior of the command
> 
> Second, the binary could be reside other places than the PATH. And this damn
> thing make sure, the binary in the path should execute only.

I still don't think I understand that :(

Can you please have another pass through the changelog, explain things
more fully and resend?

Thanks.


Also,

> +missing_counter=0
>
> ...
>
> +if ((missing_counter > 0)); then

I'd have used $missing_counter here, but what you have appears to work.
I don't know why :(


> +  printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
> +  exit 1
> +fi
 
