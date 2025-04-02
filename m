Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070923875D;
	Wed,  2 Apr 2025 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593892; cv=none; b=Om+rKVG1xx0JKppH3ZQzvATlxe8FUBIM2+y0mg0pAW3rIX1+yYTNqYpA6Tq1VVz9sz+paofPMFAQdfa7lYL0FkX9RCvI0lYsyDw479H3droehP58ctKEssTvxpecpKr5VBPwafXMO8eaRLGBrANmpmSya3gx5FWnzwUs2QkTkI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593892; c=relaxed/simple;
	bh=IqfpUtOwNUFWEhklAXOAK+rgDBmETZnPbS7ZK766M+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLRe9BQgiCEEtyZhjkHfz4JhmWJ8XawqMDzupjBHXqCl+rxsCUhRz5FyhTn8A1bVXzm6QOr0AeVPBRu1yyeobruQywQzwx9k0QF/TvalsuOILBpZLRQO5g+3I7q82fTLhf7kEDgJ9+zgv1vdKNJmf39BrloV3/O/Zn/N+v0WtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lrtU81m+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lrtU81m+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CEAC4AF09;
	Wed,  2 Apr 2025 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743593891;
	bh=IqfpUtOwNUFWEhklAXOAK+rgDBmETZnPbS7ZK766M+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrtU81m+u4zZBCo3ackiVFAG8CJIq+MBLsWkHJJJPAmlr66NUWo2ZVEVtFPATwBP6
	 olwrvrtZX0kOZhMQqFdpzV0tCmZMkwZH4RC9KgUDo5RK7zXKM6Ze24yE0dHXPy+ryP
	 aH/lAL3v6Nd7FWByz3OSQmJO/WrBVLD4lktjkimM=
Date: Wed, 2 Apr 2025 12:36:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel <gshahrouzi@gmail.com>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	eamanu@riseup.net, linux-kernel@vger.kernel.org,
	kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
Message-ID: <2025040211-proactive-afternoon-eec9@gregkh>
References: <67eccb67.050a0220.dd435.b100@mx.google.com>
 <2025040207-unrelated-aflame-bf70@gregkh>
 <CAKUZ0zJ5pMYNxsM+h8MY9gxsnW=rFjBCBjEoK8k+cUdV+5rs_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUZ0zJ5pMYNxsM+h8MY9gxsnW=rFjBCBjEoK8k+cUdV+5rs_g@mail.gmail.com>

On Wed, Apr 02, 2025 at 07:20:39AM -0400, Gabriel wrote:
> On Wed, Apr 2, 2025 at 2:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Apr 01, 2025 at 10:30:15PM -0700, gshahrouzi@gmail.com wrote:
> > > >>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 2001
> > > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > Date: Wed, 2 Apr 2025 01:22:59 -0400
> > > Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace
> >
> > Why is this here in the body of the email?  Please just use 'git
> > send-email' to send the patch out.
> I used git-format to generate the patch but then used a wacky method
> (a python script that tried to do what git send does but worse) to
> send the email instead of git send which attached the email header to
> the email body. I'll switch to using git send-email.

git send-email is already a whacky perl script, no need to try to
reinvent it in another language :)

thanks,

greg k-h
