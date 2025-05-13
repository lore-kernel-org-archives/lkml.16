Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9C17578;
	Tue, 13 May 2025 06:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118495; cv=none; b=KjIGN4x62VUPGooG3MvVlRCi/huL4P5BH7VsJzcjft4DAh6+7801XmKvuCGCvGLVJpk65A6lrzqcevpBT4VnvZfbxO5oPoKx1RWl/ImafLePlhhpz3ZvCKch9pslQNoCvSdXjNWWmWluuRR33vAoxoW7iNgoI9SsmC5r6Gh5Isg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118495; c=relaxed/simple;
	bh=mxlbiJgAwnosDbVjQMlB+UTZvwevZ1j+nJw5qI5TijM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHw5FjVLcjBHTq0JeD6m7TV/Pf0wEsTaTIV/+mx8+NrAoZB0Lm8XjrAqWIw1QAgQiV4YUCTu2zZZP6hvFneVzE/nPxp1TsEaHghwys9zFgU3Fmkg8Aui52VJ9qeQjalrIKPb4l0NXk1r8U4k4GXtjs0Vk+7to+go/CC875tF0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eRxZFyva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eRxZFyva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ECCC4CEE4;
	Tue, 13 May 2025 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747118494;
	bh=mxlbiJgAwnosDbVjQMlB+UTZvwevZ1j+nJw5qI5TijM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRxZFyva6LqoZAt4swSYmDfkS0JZAbhTY59zRmr7zVW1MuzpanbLarv/CsExbH/JN
	 krnTiwYjiYEBYopi5wVJtkt6olPVhkoJX6JwO9IP99LNMAZcDGaMAfSdzM1TKPDXce
	 LngNZUqnbvSYFTjEjAjTkTHdXOmcau+ja4P92uPA=
Date: Tue, 13 May 2025 08:39:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanav Chinthapatla <tanavc01@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
Message-ID: <2025051301-projector-earlobe-9542@gregkh>
References: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>

On Tue, May 13, 2025 at 01:53:20AM -0400, Tanav Chinthapatla wrote:
> Hi,
> 
> This patch fixes a checkpatch style issue in the rtl8723bs driver by
> correcting spacing around a '+' operator.
> 
> The patch is attached to this email.


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your email was sent in HTML format, which is rejected by the mailing
  lists and does not work for kernel development.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
