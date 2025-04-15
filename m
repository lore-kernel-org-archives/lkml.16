Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893313D891
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725696; cv=none; b=NF+k+Ui2FTpE1jHb2ZmBw1M95PcNuTwk4wjS1qc06WOnkPzO7q9/8ai8U/zRKzLLp+W4SnD9b9eT+RamRn9bWMAUrGR9pyamliB8VzHZiNrIDIAlS4gevckBonEfoa2A2UIXbcj4+DB4+uhq5YUT+Mg7ZL36JSjB6r1wbhxYlLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725696; c=relaxed/simple;
	bh=jJ00cmDebEg3Lq6cemab7gx8kqd0guaBrK8pL7azQNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFG7a4oIjOQXyfRU3Kq755WDkCEJEJoOZYBIDyNIKs+dbYyJCPWlgEo72aNIeMLZ2LKH8zMXuk3jPiEe0ba+49LYB0qElG+Utm7trjT6xDvv5ZZuwtcS7dzHfiybQqunU1GakvGDWrAMmodB1CuXHj1jSmf75hiAzzxLGlI2k6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4UBx/wc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4UBx/wc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEADC4CEDD;
	Tue, 15 Apr 2025 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744725694;
	bh=jJ00cmDebEg3Lq6cemab7gx8kqd0guaBrK8pL7azQNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4UBx/wceSav5wpibhPSfHyItpbLiETkMWRLCLOQyYdWn/xuCI/E8zEC8pew/PjJs
	 OYzcFr7RqrB1WwwHT8b6O1sXEOcuhuZZwLRkk5xkZwg0IJb1vw7SltpmnN5sr6m+Ax
	 L4SWojDv04MsQ70WGhVvp/NwIS8OXLyoKE/RWWMVMZ4k27GJjT7fnzyx8eOAOFpSR0
	 6Pj6YvJ72NlGhMKUKOpbssq4bmAM1+2+LugpMjUwpnbEzmuBn5yaTsqqFSngrW4lvR
	 xwH6+SuCplrVdJaYd3MZ4TPmiZ+7hcBKH+oAfAQNb3cuVnv+FZq8Z+J7TspUcOTP+y
	 S+1uRqZQt7Khw==
Date: Tue, 15 Apr 2025 15:01:29 +0100
From: Lee Jones <lee@kernel.org>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4] binder: use buffer offsets in debug logs
Message-ID: <20250415140129.GA2892100@google.com>
References: <20250401202846.3510162-2-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401202846.3510162-2-ynaffit@google.com>

On Tue, 01 Apr 2025, Tiffany Y. Yang wrote:

> Identify buffer addresses using vma offsets instead of full user
> addresses in debug logs or drop them if they are not useful.
> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---
> 
> V3 -> V4: Replace alloc.buffer with alloc.vm_start
> V2 -> V3: Drop transaction data addresses
> V1 -> V2: Resend to mailing lists
> 
>  drivers/android/binder.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
