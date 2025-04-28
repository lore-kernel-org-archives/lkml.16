Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0855684
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.159.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847427; cv=none; b=PUcr0EP4y0u+1szNJKAlLvBWdJ85ozXWQTAZiyyzkBXdegw7lbI67R0RMFPgfGoCZpUMtGvHLNf+lm1gGmtOBbfUMP8UEyCEfBo5Or37kTF7WygCiyupz90eV6GADOeG9QiXEbISOzfz/lqs1RKsIJeAd2zjwwlEYIcXbUSBB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847427; c=relaxed/simple;
	bh=AETgfjfdLm1cc3dIDIhiBDrptA/K0C0uD7Zn5WK7IXs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=KVYScWbHWgsvwlZn9mG7BJgoxnpQy1V5H+2smRNdzmROrnmEKxFrf0R4Q4mXJhgxf6yCAMcAR1TsP1cayaIlVW413vqQTME+VsrYbJXkjXTMuRZyvEgZnH9genWwoctb3Y+FugKwujrfqwccv1sa55ffXiOVnuVC4Dw+8AQyn+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=KsetULGd; arc=none smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="KsetULGd"
Message-ID: <5b7ecad7c0c363efc9bb8d56b193fc1f@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1745847417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yDYLL+IK8QDF/vvYy5uamVDzKiGTqC3H0Qwjjv6JLYg=;
	b=KsetULGdHdRflzfCs4PXmAod5REH5Uxa17LtbZk1qbTPT62pKMTGs7U8E8WBwUGb5g9l68
	xZF6V2b14M/qH6HDl9GB71pr0A9jeZoO/YBX0YSzn6niK6pY4rzfHr5BYLqTkibApm6nbU
	3cCMgbCE/CpoIY+PH5wogE3wkxjWV0kPDJ9VrzXVByaRER/K6AY/xO+mZ8RmhtVbCNzXgc
	slqPpSoc09uYhhrq/eZJJxmBYcuW2WCAmoJbXJx3+Zmgh8XEDPYsSutxN6YlByGg7pujsn
	iR/vPunQk2iEZjaVRqT3AyiF/rg38fJPqAyorDM9M+5xak4nClLzna3qbyoAcw==
From: Paulo Alcantara <pc@manguebit.com>
To: Max Kellermann <max.kellermann@ionos.com>, dhowells@redhat.com,
 netfs@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: Re: [PATCH] fs/netfs/read_collect: remove duplicate line
In-Reply-To: <20250428114842.3180169-1-max.kellermann@ionos.com>
References: <20250428114842.3180169-1-max.kellermann@ionos.com>
Date: Mon, 28 Apr 2025 10:36:53 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Max Kellermann <max.kellermann@ionos.com> writes:

> @@ -653,7 +653,6 @@ ssize_t netfs_wait_for_read(struct netfs_io_request *rreq)
>  		switch (rreq->origin) {
>  		case NETFS_DIO_READ:
>  		case NETFS_READ_SINGLE:
> -			ret = rreq->transferred;
>  			break;
>  		default:
>  			if (rreq->submitted < rreq->len) {

This is wrong.  @ret is expected to have the amount of bytes
successfully read if no error.
