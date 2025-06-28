Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6A71747;
	Sat, 28 Jun 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120534; cv=none; b=Sn9De1Pqz7FUA/pRi6Z44yV4wuRqUyUFaLm7MCwHimKL5OsU2njluGRFIMfK9Zht/tJBItYwlCF5n6GpXXOsnubWSpjvRuHMv4R2AhbmdRgSEwxt5UqJOqUEdTamtpOE6Mwd2uhXcdYsixnUlRfM0uXPP6QflXDWCO5WipR8uVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120534; c=relaxed/simple;
	bh=EBTOgKbMa7ugSS3wz5rgebhS88Gdc0XadFDzXKOAAf0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxy/MRr2lemdgAUYZIRpCYZtmhI7G0Zjdy1ksC09glGxXXQgdo+OpyG1Nqi3nz3AuAAA3dWRGUBIicJz18lyOXJyBEinQSjuSj8ufQo6qSOtTayHGnZbBlJrwgAehQhUVbGwZo/RRlwv2lPR6hlTGuBYc7UWwG/Hnj0Z/uj4M4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8edb7ct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8edb7ct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B0DC4CEEA;
	Sat, 28 Jun 2025 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751120533;
	bh=EBTOgKbMa7ugSS3wz5rgebhS88Gdc0XadFDzXKOAAf0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M8edb7ct4Ccwo8OtG7mZh6FCrpCzgUB2S4vXyzEmYL/wZ0F9JQJ+aOekarXGsDCvv
	 uMjrgMYuzDX6aa23j4/8Z7eVJ85GWFX53wqkuc6ceAQHMbY2Zpnzj+8JL5m5Jqlc3C
	 F3Sv+I8rXwJfz0Es7zipTdChZyauE9jp/RLftu39K2M0ZLUJGCTiJdPoacUiX19kGo
	 ErJBXdbjkDTAI8BN4I7+Z5BnToQCc9Fntsr/HC8t4TDENy1FpC3QYLgQM4cDDGawJ5
	 xNv8iWn/JBvu+5uDqV13Kx1cLaUyvnPdOlFGdDpK6FmjiGohI8+NZJpDY1nal+wlif
	 Ydm+jr3m+1vMg==
Date: Sat, 28 Jun 2025 16:22:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 0/8] Yet another set of kerneldoc simplifications
Message-ID: <20250628162209.0ba297b5@foz.lan>
In-Reply-To: <20250627184000.132291-1-corbet@lwn.net>
References: <20250627184000.132291-1-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 27 Jun 2025 12:39:52 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> As I continue to work through our shiny new kerneldoc, I keep finding ways
> to make it (IMO) shinier.  This set covers these basic areas:
> 
> - Remove some unused fields from the KernelEntry class, and encapsulate the
>   handling of the section contentions therein.
> 
> - Clean up and optimize the EXPORT_SYMBOL processing slightly.
> 
> - Rework the handling of inline comments by getting rid of the substate
>   design and separating out the processing of the states that remain.
> 
> The series results in no changes in the generated output.

I looked the entire series, although I didn't test. On a visual
inspection, all changes look good to me.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Jonathan Corbet (8):
>   docs: kdoc: remove KernelEntry::in_doc_sect
>   docs: kdoc: Move content handling into KernelEntry
>   docs: kdoc: remove a bit of dead code
>   docs: kdoc: remove KernelEntry::function
>   docs: kdoc: rework process_export() slightly
>   docs: kdoc: remove the INLINE_END state
>   docs: kdoc: remove the inline states-within-a-state
>   docs: kdoc: split the processing of the two remaining inline states
> 
>  scripts/lib/kdoc/kdoc_parser.py | 170 +++++++++++++-------------------
>  1 file changed, 67 insertions(+), 103 deletions(-)
> 



Thanks,
Mauro
