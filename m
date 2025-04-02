Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00C80B;
	Wed,  2 Apr 2025 06:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574558; cv=none; b=IiLQvxyFdFBK7+AlaWZzUUuLeEALtC3PEQhaw4VhDC4saaVBvFkUhNl9pu28QBsf2Vdads/MSHwfFaj8XFn83oHpfFFijvWELqbqBgPqGWepZ39AjbYTrwhytwCPcX5iQs/cOHmG3imkOX3IA5YshAvKiipJBwxAhpb4QsDsB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574558; c=relaxed/simple;
	bh=99FVCbPOAa+7Vptmjmp8vCVjk9agyDXnuZG/64w+534=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv1td/LBe6YQAZcrYrn6mGKWc1GTf2/70eyN0OpPDuvlXEKo6UMuTUknEa7G7UQvn6DX9tCZ3buOF8Z9hROYDZIKyCQaw1/GvlEakXwnppb74NmQdUjmTeNGJ2I+3p6KJzDhNTgEy4sq8fa1jrF1/9SUIeFb7GR903S9KKR2u8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vYH4ZXcF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vYH4ZXcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E919C4CEDD;
	Wed,  2 Apr 2025 06:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743574557;
	bh=99FVCbPOAa+7Vptmjmp8vCVjk9agyDXnuZG/64w+534=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vYH4ZXcF6x9wmTTkT2wq2O8rpF7mr6w/jwkiX4QbqiPxCVgkxAY9JCISU883boOlO
	 kxLskOzwoOKZFBJxUz2Gcv3te8CuErIb5WQv3JePM5XsBGa80EmwZBUwZ/KuaBS8D5
	 5SJwMzIfOIyhr50kGd+aSBWWIOop5+p3zbwlzHbs=
Date: Wed, 2 Apr 2025 07:14:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: gshahrouzi@gmail.com
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	eamanu@riseup.net, linux-kernel@vger.kernel.org,
	kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
Message-ID: <2025040207-unrelated-aflame-bf70@gregkh>
References: <67eccb67.050a0220.dd435.b100@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eccb67.050a0220.dd435.b100@mx.google.com>

On Tue, Apr 01, 2025 at 10:30:15PM -0700, gshahrouzi@gmail.com wrote:
> >>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 2001
> From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> Date: Wed, 2 Apr 2025 01:22:59 -0400
> Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace

Why is this here in the body of the email?  Please just use 'git
send-email' to send the patch out.

thanks,

greg k-h
