Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380C1F7569
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687581; cv=none; b=lecI+iwSwmcMAxQKu1SKz754RZnHJy6BcwPcL5suSpHBT+KM3rLLqtgKBIZ67w0hCCbwpe9hzLQ5GA0EJYR3mD8XSVLpWTIXUyC+m8F8Hhx4Ond3HYqvUk83pyz9LZGxiVKqQXlxRoxq6Q8qUzDM/kovEGENbciWX0CVq5vl0EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687581; c=relaxed/simple;
	bh=43oqbdwOprC9UPNHkUqxpd1z/jw+AN62zUMmNp4teyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTmXeUJhHsIeQErMkfJOXUPMC+HCFgqGTAW5yl/Cmzr5FMbP2iCMdStqLvYPnkwlm4OeDt+hdp2VrRSRt/PO9W+i8fY2PrDSvSVmjtPGZRZteniyIuSnXM3bsj/5TAqXJGt/tfV8u0bSy2ute76wiElYmf7Jeya+47+vFpo7ky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: GvO0wvJlR6+NER7RqFjqvA==
X-CSE-MsgGUID: LovJWiCGQiG1SyLgsDaNuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47813443"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="47813443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:39:39 -0700
X-CSE-ConnectionGUID: Lna2SMULSHiiTY5uzffYeQ==
X-CSE-MsgGUID: 9H3vSqYNTky4lvnzeXdRJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="132137348"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:39:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u0Kn7-00000008p9g-3zJp;
	Thu, 03 Apr 2025 16:39:33 +0300
Date: Thu, 3 Apr 2025 16:39:33 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 3/3] staging: rtl8723bs: Prevent duplicate NULL tests
 on a value
Message-ID: <Z-6PlWGmn09hYYKU@smile.fi.intel.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325d06f5a4eb18eb52eb20d5af89207504c46b6.1743685415.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:26:43PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle

Missing period.

...

> +			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> +			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> +
> +			SetSeqNum(hdr, pattrib->seqnum);
> +
> +			/* check if enable ampdu */
> +			if (pattrib->ht_en && psta->htpriv.ampdu_enable)
> +				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
> +					pattrib->ampdu_en = true;
> +
> +			/* re-check if enable ampdu by BA_starting_seqctrl */
> +			if (pattrib->ampdu_en == true) {
> +				u16 tx_seq;
> +
> +				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> +
> +				/* check BA_starting_seqctrl */
> +				if (SN_LESS(pattrib->seqnum, tx_seq)) {
> +					pattrib->ampdu_en = false;/* AGG BK */
> +				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {

> +					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;

While at it, make this more readable:

					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
						(tx_seq + 1) & 0xfff;


> +					pattrib->ampdu_en = true;/* AGG EN */
> +				} else {

> +					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;

Ditto.

Also consider to use module operator as it shows the exact amount of the
records we support in the circular buffer.

					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
						(pattrib->seqnum + 1) % 4096;

Since it's power-of-two denominator, it will be optimised by the compiler to
the same code as it's now.

> +					pattrib->ampdu_en = true;/* AGG EN */
>  				}

-- 
With Best Regards,
Andy Shevchenko


