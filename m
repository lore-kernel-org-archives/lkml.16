Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4218DB01
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745658438; cv=none; b=IzbPXZUZf1k57dHBK+MkinZ7ExyTaqdInCxsEACTaiqwqfHt15tqV33K5sQISagVmTkz/ZOKnZrtiEVYqXwRWNLu3JAyx85hGYrO8nl8AjgPIRnCTVeEXL+aHYcHKD6F/GKBBbJKYylEukqZnD3cSadqU814cNj2vfXvQVXnT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745658438; c=relaxed/simple;
	bh=v9hDuCWhavvCBYyCg3ieuTw45sKZqqSPcMJBwCI3mY0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K2cZpBk2+M7jyPOyNr0sL+KxXUjOnssY7Z/6tMb/ZTOXeFO2mA3TPCK0YmJhsqBXI0w/0S76bFza97vRWgK0xNKbsDJRqXAQ3zdK5wZZrEx2xdZkIqGgiHZGpP3jq4yIdtNoLP0OS0w6VzirK2VqT1khN3EfgLGDLw3PqbCiwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=K32VdHBy; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="K32VdHBy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8AApgGUwlLj6Gs+SUoHCvgORILlTV8gi6iYIocnjspQ=; b=K32VdHByAmjV0I5O2F5/4hHrUF
	YSaKYDMQTk46wElTYbU37jnvJqqczrku5WqMrC3o9G4NDNvOIuGqOQRLR+cgNKoi503LgADZjJy6Y
	VF/FFUVrc4ZB8PZACFxOloHZ5Dtf/g9Zjh6BydbJGp2ZB1pFg4FmV6sy83iqBJ6pyu80lSSh7PYmi
	nlUCbqpY3Hc/iC4Y2K8TVpXPPU9N+bu1/jc7E8/vVpbNEaoIcxsm1zz3KgKs+s8zoVBRNkkUAoMVf
	XLj/jjDVUXi3Y1KEwOwX2V1EjOpZdOpbSMSZuo3axNI1TFJVBerhSOIiO68hEYA5nvLc8ESlhtq0T
	o7zM3LdA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u8bV6-007tOB-4x
	for linux-kernel@vger.kernel.org;
	Sat, 26 Apr 2025 11:07:08 +0200
Message-ID: <3cea2984-ac0d-4907-b823-17bef3ecb97d@bit-philosophy.net>
Date: Sat, 26 Apr 2025 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: De Ext wavelet, patent free (was low jitter, philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Tired of mp3 patents? I have now realized De Ext wavelet, name 
descriptive, for patent free twice efficiency coding, with phase 
preservance.

Hereby released into The Open. Into the same line of thinking as an Open 
DAW.

This part of my Correlative AI Idea, and the biggest correlation there.

Light!,
Ywe Cærlyn
Abbed
Bitstreams OS.
