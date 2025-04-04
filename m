Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC91F94C;
	Fri,  4 Apr 2025 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753702; cv=none; b=bAnwM2UDpcimkx6UnFoC+RRtVyujkS3QnqkR7VcUNNhJkAMDxK4cSl7n12ck0+/64zam0rGEWBfGCFCP5EYkNBqatsNH01ZwBc0mfo3WmHn+7CS/iHppSrzFTcqkyF/dFKG+/5jmJSbLbjYFoDI1FoPHa/STzm+bwXwBUIZWowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753702; c=relaxed/simple;
	bh=XGDcsxMX4EX8pButEvSBCGtI18wKW5vv4Uuvru+/rqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0Ix6QOLB3QV9uLVJ6/a4l7I/Erp8m33rQB6IVzqhXtXnedsQfpvs4NCorkN1nF9T1P+/8wT7Tq3OOUQZIo0EngxAT8Pt3BMsvKVUqQLKaGlMPXarK2Xrf+YEc1b6nOTYKsOfNgN9LbP1tKT4UzXwI0mNK7zqLPuUFROnDqYx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dmaw2z9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dmaw2z9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E550AC4CEDD;
	Fri,  4 Apr 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743753702;
	bh=XGDcsxMX4EX8pButEvSBCGtI18wKW5vv4Uuvru+/rqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dmaw2z9zzWVzG1LNAgjizZNOUf6Yt8aTtgfdvjH5T5YMBm6VQyYHbnW9DIsVw3EIJ
	 i9lZjxDqq3yx16BB3rD+sUTI37OURFq93CcnC+0vPvev3GvbzPXshDVtUm5YWlCJNB
	 pjJliBpFmEfmhVHSuE/KFGpKRQ+DDHimdPEEemIw=
Date: Fri, 4 Apr 2025 09:00:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org
Subject: Re: [v4] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <2025040401-disobey-flop-d7be@gregkh>
References: <Z++PnxFQFe+IexUi@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z++PnxFQFe+IexUi@HP-650>

On Fri, Apr 04, 2025 at 08:51:59AM +0100, Abraham Samuel Adekunle wrote:
> The struct sta_info field ieee8021x_blocked uses the uint values
> 0 and 1 to represent false and true values respectively.

Nit, you don't say "PATCH" in the subject line, why not?

> 
> Convert cases to use the bool type instead to ensure consistency
> with other parts of the containing code where true or false have
> been used.
> 
> This change causes the struct field to change size from a 32bit to
> an 8bit. However, the change is safe to make because the sta_info
> struct is not read from the hardware.
> 
> reported by Coccinelle:

Shouldn't something come after a ":"?

thanks,

greg k-h
