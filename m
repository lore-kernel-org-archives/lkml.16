Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325B185B73
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899901; cv=none; b=SeBZxfyaKcS+V72juKA2Bq2MpCSYuWNkNwrNT07im0K1W30MQPc0diX753IyMnliN6GS4BY0FVbTt0Ex2/5XIcphI3flkiGQOLnKMRUMEMk6XNrbp0cI4u+Hl1v/xknUKQxf7nsfgalY9fLICp73FK5TJrSQ/1n/MZrqEh0XrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899901; c=relaxed/simple;
	bh=zmz2ZQWYdSmH74faE2rY74Z+TjDZ+e3NQ8ZPQur/jnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MphPMzxBK4FCgYCIHa/eR1OfTr1FeVCudYYpiQSczLdQLSe+gFJNFx/mLhHwzIjvUU+gzC1kdQGm2m+4aw9A2P52iFPkP4yP6u7wdqq0ebWEh2l0YAzHRLjSblbTtK29XIbosGFIPYq+musLSD3wUXzAZlDZgERk/Ss53e9pLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A8A8E68C4E; Fri,  7 Feb 2025 04:44:55 +0100 (CET)
Date: Fri, 7 Feb 2025 04:44:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH RFC 01/33] scsi, usb: Rename the RESERVE and RELEASE
 constants
Message-ID: <20250207034455.GB4596@lst.de>
References: <20250206175114.1974171-1-bvanassche@acm.org> <20250206175114.1974171-2-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206175114.1974171-2-bvanassche@acm.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 06, 2025 at 09:50:42AM -0800, Bart Van Assche wrote:
> The RESERVE(6) and RELEASE(6) commands are obsolete SCSI commands defined
> in the SCSI-2 standard. These commands have been replaced by PERSISTENT
> RESERVE IN and PERSISTENT RESERVE OUT. Rename RESERVE into RESERVE_6 and
> RELEASE into RELEASE_6 in preparation of introducing a new RELEASE macro in
> the new header file include/linux/thread_safety.h.

The rename itself looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But RELEASE is not a good name for a global macro, I'll return to that
argument later.

