Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D801B5EB5;
	Fri,  2 May 2025 06:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166712; cv=none; b=OwmJGPhcakvsLgvr7XaCJFSg4632YPqUPIEtUp2xi0dmYxbZQUtVhn2RvY3hB1h3xFk0G22Szst1dyZhKn2yQ82/4uCHKNQJKSgb/79gZYDzLUprOdA0ELLbPtWbKr/xn35/Qk7SPsXtrV0wbtrbn6+LJeRMbXFPqZ/NNhrIc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166712; c=relaxed/simple;
	bh=QH5zmveZ3tkrMyfEvXCcQIu5etyU+0RxsoWFQk1D/Tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VMHZKjOaCmTUsg+0/zFiav+uGRQbg2UXQyIvsuMDAR2/Ymrh1RIqeaBgnw9dQVuVd3PgKCeGjOl5JzTfFDR51xLEerNsDfb6QhGk5k0XmBwW1vjKlTUd6upg8K3C4sH03UAU8rDIRv9LUCzkfetwHWsOAVT9WdTBTrypN9tW1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XYsX5m1K; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XYsX5m1K"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 27D9141060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746166704; bh=mqrRS630yitmkII5G69ZLQHgBIzzOQYzm/FelGNKJgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XYsX5m1KH2XZ0UXjxiAMyMAc47E2NnBw1B/QYBPouAfBZLiwlQ6Q1mAdA80/qB3w+
	 9sKbRPvuvDj51/0pM+++rImlOA9PHN4XGSCKKO1i0TDsoEI0kTA6Cq3KzghBoPYhJ4
	 91m+FFpP4qIn3cFsI2poTxBJh3F44cWHt9dpw3e/PlekkNsCxvHM3K632iwmT/qd60
	 41rUvZeT0Oaue4bFfzjXTs2PdLVGbw5W+P2zr3uA73o8D8DqNPrvuL9KCT3LJMzxZ0
	 kQP4SruSjzJbQz31teTPjGtmd5GVDjhQ46ygif60NUg9FGlZh/uf7tsv4FWAYu/ijz
	 NjiMDS1yJJt3g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 27D9141060;
	Fri,  2 May 2025 06:18:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Swapnil Sapkal
 <swapnil.sapkal@amd.com>, peterz@infradead.org
Cc: kprateek.nayak@amd.com, gautham.shenoy@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shrikanth Hegde
 <sshegde@linux.ibm.com>
Subject: Re: [PATCH] docs/sched: Make the sched-stats documentation consistent
In-Reply-To: <aBQnuv9JLOHYayiu@archie.me>
References: <20250430062559.1188661-1-swapnil.sapkal@amd.com>
 <aBQnuv9JLOHYayiu@archie.me>
Date: Fri, 02 May 2025 00:18:19 -0600
Message-ID: <87ikmj1qok.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

>> +    9)  # of times in this domain detach_task() was called even though the
>>          target task was cache-hot when busy
>                            s/cache-hot/hot-cached/ maybe?

That strikes me as anything but an improvement; the existing phrasing is
fine.

jon
