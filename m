Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F30BA45;
	Sat,  7 Jun 2025 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749302576; cv=none; b=D1exCFgCzSIof/1MnCm3Gdbj09pMJERLEVwDdClHJ2T43szxEuLxFpPdfA2/MB8ZJKMHfz9wsX0uLluhnhvA1e6OPG4Ecp+RDwfrMwg1E0s6Eb0FZmZ6vJi/Isz6k58FqRxEKTXF1U9hWo6CMy8akD/kgQp4gEK6Fx1xsKMk/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749302576; c=relaxed/simple;
	bh=PEGI5ThpE4d6VX+ncYk7KMiKnnSSRFSA3Q2QOnWFVYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HOLlg18/iVLT8FlPEzsw/3DkoT4QiBCqApuZqEWllmQ61u+9XAX5ZMpz+yLiR38PBhGvZUFpvYMEpDCIwknmno7QAH/7aFlQ2rSgFWJmVjONM8IH95ElnfCYgIM85OcwdSwdQ3Y/JDGkLs8lZ9FDXHLzQTWGyiAjIHAMgMFEuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=osezAeg5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="osezAeg5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2B71341EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749302572; bh=FsHLDlLwg/GJofvnvqgi5DZPj17QgOSV+Rs7gyfeJjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=osezAeg5t0Ebg1eFkYA0qiUQ6KzuDHjFR2roUynIhymC59CU61mt9Lh7Vl7A3MFSn
	 /nLtyYj1z0tTPWb5O9sOAPpL/HL8vyiU3THvMs2ntfWN4Uo3J97v/1nbWA72dOu8X+
	 rQXiHD1L2f0CQCWmu5BI5ai/NgZY3W8LoO3Tvn/Xax66dWphCu0hul+kazYzIlcWf1
	 jh8roIaGj32M9aYW+B58XVeHKCVFj4syLPIxjAa+schdVQ0sXn0QYLUJnUC81JNIP0
	 iDLvr7ikICP3784ZUxgxeHlgGkU3JeTB1T3ez5ur9GkPe5+NDWLSsg1vvo7sgbjhHa
	 fOG3zVG/GxNlg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2B71341EC3;
	Sat,  7 Jun 2025 13:22:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] docs: kdoc: remove the
 KernelEntry::is_kernel_comment member
In-Reply-To: <20250607120745.7e0fee67@foz.lan>
References: <20250606163438.229916-1-corbet@lwn.net>
 <20250606163438.229916-6-corbet@lwn.net> <20250607120745.7e0fee67@foz.lan>
Date: Sat, 07 Jun 2025 07:22:51 -0600
Message-ID: <87y0u3d6tw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Fri,  6 Jun 2025 10:34:34 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> entry::is_kernel_comment never had anything to do with the entry itself; it
>> is a bit of local state in one branch of process_name().  It can, in fact,
>> be removed entirely; rework the code slightly so that it is no longer
>> needed.
>> 
>> No change in the rendered output.
>> 
>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Not sure about this one. The idea of those warnings are to detect 
> non-kerneldoc markups that typically comes when someone "imports"
> OOT drivers or Windows one into Linux.
>
> I remember I catched several such cases in the past with the help
> of those warnings.

I haven't removed the warning, just the use of that specific variable to
trigger it.

Thanks,

jon
