Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E87F22AE59
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751137; cv=none; b=Nrh6geXglg2hgoXH/iqEYBRpHkG1mN3rpzkESs5zMDuJndLQUsWOa9DOypcjQbv+VmZ6ne3A53jNwWCHeEcAn5+hQ1xEB9Nrz+u1v1JC8AztT48PW+S/D8GggUfhtrYjS31UAOtObxihS0jtGf3Ekl/aWxOMVGOJhKiHyt3Y46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751137; c=relaxed/simple;
	bh=EPKQBg8QBfgGr70sM9uNyjThGsDeBrpvrn7X029CQw4=;
	h=Message-ID:Date:From:To:Cc:Subject; b=e+XTiJ5TLDF3+YlmfCl3Az/7PKADbmE4ATlpU8kyaSA6cyV2mCJ47dNpjkQ41WASIRDqWIP3ocp4j4DPQVaPsCFSLpJjJ9FHLD4t+p4+SicrveZyplkyrfDjWZo+FiEk00wtGsb6bs7RsCOXHD5X/b+NYCTYjVxsqsByYYW4NAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tvf6ccpp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tvf6ccpp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YcyiPUnr0DLfGjtMPHuu0x83N4axgRPt4qEYkYKlHBk=; b=tvf6ccppTIzSHnZr6rinoUjtuc
	e5B716wkx9Qa+fpckV2rzT9SEYe4etsNP8EpQPVr+WTiFSl4DjYyovrzaokWNWLivJR8MSm95Lob+
	KUewXHTmyCHQdFwmWnM0iwLw7gvyW/wXdP0/mRpjbB7UbH/lXxmuRHeIgEx7Mq6lKs9lYW2SRUptq
	FFAx1+eeQdnH2vZFyE8CgxKPZIogVtirxojY8wOKKMzMh//84GGBBhdScVhSKdIDnk+HI0rvL824N
	kiHsDXBC+Nb/NRc4Hzj/7B2FOcfO3hO1O7wKpBW2WHj6AFCcvoAZlUqCxQqGD1ugwKtK869yYkIJZ
	OdGH/+IQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-00000004GPQ-2ZnB;
	Wed, 05 Feb 2025 10:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id AD69B3002F0; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102120.531585416@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 ravi.bangoria@amd.com,
 lucas.demarchi@intel.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 willy@infradead.org,
 acme@kernel.org,
 namhyung@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 kan.liang@linux.intel.com
Subject: [PATCH v2 00/24] perf: Make perf_pmu_unregister() usable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi

New version of the perf_pmu_unregister() rework. A fair number of bugs
squashed.  Much thanks to Ravi for writing a stress tester. The robots also
managed to find a few problems.


