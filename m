Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182A3FF1;
	Fri,  4 Apr 2025 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748094; cv=none; b=GDtisJURD3ZAVFvABnQx6Sypgtk+mB8s9bS1n5IbV5+3M/nTbQATxH8igspTV7T/NN+ZrAL5p/yfCDH7ebcHQpTZly1m4L8OGVT+vXiX9x+WFKz2dSwLSth2ZqzExzKGNaTHqAIknbjtAtNaDC7uxIPb6NmQz0Qa/GVpgbHD6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748094; c=relaxed/simple;
	bh=r/MebVUtbqNtdPu8rISHn7ez5shJyN+NBy5O3Fcgf8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3aTVFMqaaMG+9f9FNXMtavrR+F/paimUzWbM/PuixU/VJJiNQ+H7iPJ6MdXnQBqnomblb0O+6QEG5Mm0LaOnCmMbMg2iuZzaqItDIk5gveu6nv4+/9+qqNPaTKyFAuOHZACxvKBhxicTUuI3gCscq7JgjSVYUomTzjrBXyfAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1jRf0viF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1jRf0viF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C940C4CEDD;
	Fri,  4 Apr 2025 06:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743748094;
	bh=r/MebVUtbqNtdPu8rISHn7ez5shJyN+NBy5O3Fcgf8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1jRf0viFJ8X309jQNavhhIMJxNad6fVpPVTKydjuglQtSRBEpd+nzdxV1fZ1ZMSgC
	 y1zVMGxr0WRNfT9pAoLv4N+2QZQRbpwHvupVu0ZycQDXd9cKQkjof+Ky4BMDCX803j
	 F0icHmHtoAeewoMwVl2osBcwdPpbUlb2i5wBbNn8=
Date: Fri, 4 Apr 2025 07:26:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com,
	eamanu@riseup.net, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove trailing whitespace
Message-ID: <2025040429-avenge-camera-8d88@gregkh>
References: <20250403160807.100057-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403160807.100057-1-gshahrouzi@gmail.com>

On Thu, Apr 03, 2025 at 12:08:07PM -0400, Gabriel Shahrouzi wrote:
> Remove trailing whitespace to comply with kernel coding style.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

As far as I can recall, I did not suggest this patch :(
