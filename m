Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D7211C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745817921; cv=none; b=HW8S8eGigM4wXATgjwzNl8FbDpF3y1s7Pl2SSTyt4NCQ087JBA9UpOvVTZTelfIehfWhjNZ4GTXlo6kdDcrvLZsBc6NSDpGjuhIQjf6oGjgG2zc25C6EArmrOnjnZQkTOdsHJ+FierlZc8gYk2DAYsxDEt1yQDHmMrHnYEzmUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745817921; c=relaxed/simple;
	bh=9ByCT0iFVeF2bh6j52YCXt9aL9rJLUTMQOTYbq5aCgo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=DZnShxa+Ip1jO6ZtmtqkWmuS7ivcijgq6nE+80Cg3cYQs7UzeUQJ5Sftyhnr2fMDIWjLQIvxeQDrE4LtWXhy84dKumO3k+yjpzyPUmicRIBvr3vjNrRyLPqSndul7x+gim6icO59BH3O3EqSN6dcXNC1Czrps+ETCFWzT6SrHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net; spf=pass smtp.mailfrom=bit-philosophy.net; dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b=Wt08eZcV; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-philosophy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-philosophy.net header.i=@bit-philosophy.net header.b="Wt08eZcV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bit-philosophy.net; s=ds202411; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=efn5cVV2xfBgxxN9Cy/IU+g+7ZKqNGqGtDszbXGpqwI=; b=Wt08eZcVFUiJGmLJHhI/AvfvpK
	8AbKOpsg1NnW5DboQP2N09XpUHolSgJYsRkNolQFAGc8z/7rNv+x2QSlljINXT8LDSfB7jIgcv3Q5
	U8Cu899vyaLpwFUGu29NypqwpYX8fz8ItCsScyEUgFy6X+YOR8uJoERJbYTKxe9E2CB2RmwVwaDge
	EMm44zbbx1ezBEyY7G1MJT+jx1YXtK7dH6GuobNeMzZS7nf2a1SQjJJPzOUc+9Zkpn9DVYNSMvTrT
	QzPZBofVRLcRJwGyfeihzqUjfGQnHccJ3mFmwbyCGXPDTPgcaSXFWlIDWf+UN/5jJQV8s9UxArjPE
	/rY5iOuA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u9GzN-00Gk79-63
	for linux-kernel@vger.kernel.org;
	Mon, 28 Apr 2025 07:25:09 +0200
Message-ID: <33ca7d20-090a-4e86-accb-7b96b0e61ba7@bit-philosophy.net>
Date: Mon, 28 Apr 2025 07:25:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <ywe@bit-philosophy.net>
Subject: C^3 Instruction Set (was Low-Jitter, Fair Pay Philosophy)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The bus bandwith could be used more efficiently.

I hereby suggest the C^3 instruction set, using only 1/3 of bus 
bandwith, and needs only 256K Cache.

In line with my low-jitter and fair pay philosophy efforts.

I recently also realized De Ext wavelet, for patent free filtering and 
compression.

As usual, more on https://bit-philosophy.net/

Some playlists: https://www.youtube.com/@Bitullahs_Office/playlists

Light,
Ywe Cærlyn
Abbed,
Bitstreams OS.

