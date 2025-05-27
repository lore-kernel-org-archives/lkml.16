Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75734CDD
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352338; cv=none; b=GlmCLM7uSgIvuAYu98S/um3zBcGI529oHNo3SM8zfnLZAho/uykAmfPyS7vEM26/JuPqIP7PsBxR3Ynjxh7km8QrpXGJ80MC/5jiEZmZiyvKXBzP/Zy2p2eg+WH8NIO5kLPZzFu1rEitb/4BoXI6fUVVOp2/BzZxux1YhOTPjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352338; c=relaxed/simple;
	bh=TvVroCeXMQ1E92k4QZDq/IbdzgpErCk/aa/SRYq7yOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d85/CQK4psfDxVgs5fPJzhJO5whEU1iXMJAYwYD6ytaszCtWMgUiUlZys2Y16jANgfByQQTolIMFJ8HYy06LThQLrVttBMO6LTvVBBXPey0Mj+Bll7+WZ1JJiiys+BukdD7+MokJWYaKh+HDcmvBxfKiwPZoJ4QXBrbH9JMmV24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L6rE3Svu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VXrNMJJA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L6rE3Svu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VXrNMJJA"
Date: Tue, 27 May 2025 15:25:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748352334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYqi3NCQ/fWAGKheVdTWlSvTDjl5Oax78MP1xbuGcDM=;
	b=L6rE3SvugLFDTD6W0OUDGsWvov6TpZ1pXBVEkxiznI2xmgvgzAjFVdzrdNAy+d+mQcx+NJ
	Ss1Av0Qd8f8lyJoNXfbgR9BSDRdeyopC4tM+cDrg6qxWZ5hnoGbARrttht2ewW5/pQpfi/
	ZHtNDA/mJ2gwEuC+W1jT+dCAyt8eZ2DI/Zrdt3i6AZ+X1H1YBDQsIUNDmCIBueDnIXcdPy
	vdaHYya675GwNLnUWHPfAoTMe9cJuAXtsjjqrWdUxz32r5u4WB/di3GwAzV8VPb91FAcRH
	KJa8Z0GgCCTAkhVSW+NsdrT7pzGUM+eHqUlzu2prIzVjEpe7Y0fRv2Sydt6R/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748352334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYqi3NCQ/fWAGKheVdTWlSvTDjl5Oax78MP1xbuGcDM=;
	b=VXrNMJJAkIMEyx4PChnv/Lbs3eo5ZBcfUIZQ5ds5ebt/rGzVkrALRUGHNMrCe729Gjhix/
	RoSz4P1/hMOU8pBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <20250527132533.lqWBepWy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
 <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
 <20250527124327.5UDnm-ho@linutronix.de>
 <269b2f41-1405-4cab-9310-11df428e64c6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <269b2f41-1405-4cab-9310-11df428e64c6@sirena.org.uk>

On 2025-05-27 13:59:38 [+0100], Mark Brown wrote:
> I'm not seeing that test being built or in the binary:
> 
>    https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d146/arm64/defconfig/build.log
>    https://builds.sirena.org.uk/cda95faef7bcf26ba3f54c3cddce66d50116d146/arm64/defconfig/kselftest.tar.xz
> 
> (note that this is the specific commit that I'm replying to the patch

Ach, okay. I assumed you had the master branch as of today. The whole
KTAP/ machine readable output was added later.

> for, not -next.)  It looks like it's something's getting mistbuilt or
> there's some logic bug with the argument parsing, if I run the binary
> with -h it exits with return code 0 rather than 1.

I copied the logic from the other tests in that folder. If you set -h (a
valid argument) then it exits with 0. If you an invalid argument it
exits with 1.

But now that I start the binary myself, it ends the same way. This
cures it:

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 2dca18fefedcd..24a92dc94eb86 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -130,7 +130,7 @@ int main(int argc, char *argv[])
 	pthread_mutexattr_t mutex_attr_pi;
 	int use_global_hash = 0;
 	int ret;
-	char c;
+	int c;
 
 	while ((c = getopt(argc, argv, "cghv:")) != -1) {
 		switch (c) {

Sebastian
