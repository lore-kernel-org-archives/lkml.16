Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB221D3F9;
	Fri,  9 May 2025 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776096; cv=none; b=LKXFXvn+OieIJHz4CERlPCxoRCPjCwlXATxDkOiQe09p4ulbprXmsm27ZQUL9hmkJ48sH348ZtEv74McWrE6H0t8vonXmz4hOICMgy7oXAnYJvXIFFDmGwNXQPDBU+86DkQUIIu/lhaVjbreeby+8owt+gCdo4Szwt3pFH9kLTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776096; c=relaxed/simple;
	bh=Vn6JVrO12uJrcP6eKKIU3lUUP+MT6t+jbwAvtdD4Ps4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az8NWuowuhIDNXB2Wqpgu/7XKZqhwZZE74SgeW+UyuabHT5lWrmarJMOpz220NlbopTeVRQAc3ZHLGVVNf5WuGURMZS1RVt6DydF1blvuvkPisHcYj/CwbfRDx0Kou5Eb9W85TRXWgdKW+OqEfX+w9e7lMD9zlpaLZ0tlf+UIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SkWemUxx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SkWemUxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CFDC4CEE4;
	Fri,  9 May 2025 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746776095;
	bh=Vn6JVrO12uJrcP6eKKIU3lUUP+MT6t+jbwAvtdD4Ps4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkWemUxxrAEJyqDxTrvJ3y2NygOfqDdBhwMo07Uvvb3rpbKRMw2UzyH41qI+scRma
	 Lb5htPt3yZjvPvoPHkz9t5ylgi8ESPkk8WXFBwIKwXYkCNtVPKV3He61tuieQIA0r0
	 on5exrZ/mZlo+Tq6xFNWAcrz9ylW5apA4gW+IZgI=
Date: Fri, 9 May 2025 09:34:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <2025050940-marrow-roundish-8b98@gregkh>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509072033.1335321-1-dvyukov@google.com>

On Fri, May 09, 2025 at 09:20:33AM +0200, Dmitry Vyukov wrote:
> > CVE-2025-0927 has now been rejected and is no longer a valid CVE.
> 
> > Filesystem bugs due to corrupt images are not considered a CVE for any
> > filesystem that is only mountable by CAP_SYS_ADMIN in the initial user
> > namespace. That includes delegated mounting.
> 
> I wonder if this should be the case only if the image is flagged by fsck
> as corrupted? Otherwise I am not sure what's "trusted". It's not about
> somebody's "honest eyes", right. E.g. in the context of insider risks
> the person providing an image may be considered "trusted", or in the
> context of Zero Trust Architecture nothing at all is considered trusted,
> or a trusted image may be tampered with while stored somewhere.
> 
> Without any formal means to classify an image as corrupted or not,
> this approach does not look very practical to me. While flagging by fsck
> gives concrete workflow for any context that requires more security.

And how do we know of fsck can flag anything, AND which version of fsck?

We'll defer to the fs developers as to what they want here, but note, we
do not determine "trusted" or not, that is a use case that is outside of
our scope entirely.

thanks,

greg k-h
