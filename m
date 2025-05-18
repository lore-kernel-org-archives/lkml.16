Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CA219319
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570377; cv=none; b=IZ4x7QKQy4Vn7XnNifAAq/kbAPAGAFotPYLlTTwLZvv+hqgECtE3a15DSF7Vw1dGLrXmwHzvMs3lCk6d9aBjg12eQIbefmGHpfk+jduJJzVpoGzBEhFZOjvFWlKtqa6WPRApKMla6+TuPa+L70w/ssoSktfWfLWlGxPC2tJ/CW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570377; c=relaxed/simple;
	bh=iTm8ah+P96IcLYj85YBN4c6VJTTCMNu75R3khsPbxgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJhk+sf7FpYQ7lyy1zHN3vSeAVUaCRwfdGyPNeSia0UZARF5y9s180/Zo88gbNngZXB01H05cFAUv+AqTmf3fIlfENz5JVOKf48Qd9ZC0jnKbskfvwHqw/iy11FGC4bao6BepiEyPESNQisV+I5BA7o2i9oJlsT7CpMypcjPDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OGy+Zr+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OGy+Zr+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48F1C4CEE7;
	Sun, 18 May 2025 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747570377;
	bh=iTm8ah+P96IcLYj85YBN4c6VJTTCMNu75R3khsPbxgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGy+Zr+JosWhneJp/mYL/IGewgqxErjpMwdiqhLJKEnIAqn0edLUx53v3lYT+kh5i
	 FDxD9m4xIPu/cNyxKILMLOu0GBIN+gPmJYeeceQFDev+/hdfVBOkSZ1iPgaR7Z7oqQ
	 ts8NJQKQKISWZluE1CaQ+Al48kizv7sl8FRUSKZw=
Date: Sun, 18 May 2025 14:11:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Velez <jonvelez12345@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
Message-ID: <2025051805-astound-unaligned-db5c@gregkh>
References: <20250518113330.8976-1-jonvelez12345@gmail.com>
 <2025051820-unspoiled-rift-31f8@gregkh>
 <C49E4FFB-81F5-40DF-8DD6-5BB4A3B782B7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C49E4FFB-81F5-40DF-8DD6-5BB4A3B782B7@gmail.com>

On Sun, May 18, 2025 at 08:08:46AM -0400, Jonathan Velez wrote:
> 
> 
> > On May 18, 2025, at 7:58 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Sun, May 18, 2025 at 11:33:30AM +0000, Jonathan Velez wrote:
> >> core: Add documentation of "sg" field in the dwc3_request struct.
> >> 
> >> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
> >> ---
> >> drivers/usb/dwc3/core.h | 1 +
> >> 1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> >> index f11570c8ffd0..bb140dde07d6 100644
> >> --- a/drivers/usb/dwc3/core.h
> >> +++ b/drivers/usb/dwc3/core.h
> >> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
> >>  * @request: struct usb_request to be transferred
> >>  * @list: a list_head used for request queueing
> >>  * @dep: struct dwc3_ep owning this request
> >> + * @sg: pointer to the scatter-gather list for transfers
> >>  * @start_sg: pointer to the sg which should be queued next
> >>  * @num_pending_sgs: counter to pending sgs
> >>  * @remaining: amount of data remaining
> > 
> > What commit id does this fix?
>    I pulled the mainline and worked on the “for-next” branch. Is that the correct process? Should I be using the “master” branch instead?
> > 
> > And are you sure you made this against the right tree?  I do not see
> > "sg" as a member of this stucture at all anymore.
>    This was the last commit on the “for-next” branch:
> 
>    commit ffd294d346d185b70e28b1a28abe367bbfe53c04 

That is the 6.13 release from way back on January 19.  I think a few
other things have happened since then :)

Please work against either the development branch of the subsystem you
are submitting changes for, OR against the linux-next tree which merges
all subsystems together, so that you do not accidentally use an old
tree.

thanks,

greg k-h
