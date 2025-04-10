Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D02036E6;
	Thu, 10 Apr 2025 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269097; cv=none; b=JZCm+q4H+Nrkv5QSLAkoFnap6ZwMLRSLF/4bZ9nKHV22gNhIHY7Zn8llmvXuzawLwXS6HrWqdJKwqCJ3lzfWZGwhM0cjRKgPAuLEqR+bZpKQqgd92zrFgn1TI9MhOvK6c7PemB9WowCXTUA8084EK8ZX39q/M1CsrKuV/8oXNXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269097; c=relaxed/simple;
	bh=bPzeZgrP7PD3Md2w9w9dvWl898tFcB9NhFWNXwu0U2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFGiba6PWbRmyntCeQSs333BfDNE0Ij3KtTXv7wK5j811C68C4jTs0KXlDqNx45M14WsA8jW7rRlFZ6+hBxkK30ar38xKj5Epc2xHXjl1j80Zw+amo7+vLs8FaQ9M6SEJfbbRa5jwTUh5CrFQuBndoVvuTsQoyTgXapLPYR/R2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NUBxNMQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NUBxNMQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EAAC4CEDD;
	Thu, 10 Apr 2025 07:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744269097;
	bh=bPzeZgrP7PD3Md2w9w9dvWl898tFcB9NhFWNXwu0U2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUBxNMQEaQS5a/bjuTtaryrBfraPSR8ULIOyeiTlDT6ymfmBkHo56NS+KeAD2k1fq
	 bWbW/LhSa3QvBfS4dDQ4CN1yh8vvA89BIUoFYfKuNoxHJzU9UT2ZivgBiK21iJ0rBz
	 xHnePbCD7Hf44XD717vA1ApB8xsiGaoFrGLSfBzw=
Date: Thu, 10 Apr 2025 09:10:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: joswang <joswang1221@gmail.com>, Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jos Wang <joswang@lenovo.com>
Subject: Re: [PATCH 1/1] usb: typec: displayport: Receive DP Status Update
 NAK request exit dp altmode
Message-ID: <2025041054-landside-filtrate-17b0@gregkh>
References: <20250209071926.69625-1-joswang1221@gmail.com>
 <Z635BJNnFAiIFXxM@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z635BJNnFAiIFXxM@kuha.fi.intel.com>

On Thu, Feb 13, 2025 at 03:52:04PM +0200, Heikki Krogerus wrote:
> On Sun, Feb 09, 2025 at 03:19:26PM +0800, joswang wrote:
> > From: Jos Wang <joswang@lenovo.com>
> > 
> > Although some Type-C DRD devices that do not support the DP Sink
> > function (such as Huawei Mate 40Pro), the Source Port initiates
> > Enter Mode CMD, but the device responds to Enter Mode ACK, the
> > Source port then initiates DP Status Update CMD, and the device
> > responds to DP Status Update NAK.
> > 
> > As PD2.0 spec ("6.4.4.3.4 Enter Mode Command")，A DR_Swap Message
> > Shall Not be sent during Modal Operation between the Port Partners.
> > At this time, the source port initiates DR_Swap message through the
> > "echo device > /sys/class/typec/port0/data_role" command to switch
> > the data role from host to device. The device will initiate a Hard
> > Reset for recovery, resulting in the failure of data role swap.
> > 
> > Therefore, when DP Status Update NAK is received, Exit Mode CMD is
> > initiated to exit the currently entered DP altmode.
> > 
> > Signed-off-by: Jos Wang <joswang@lenovo.com>
> 
> This looks okay to me, but Benson, can you take a look at this?

What ever happened to this patch?

