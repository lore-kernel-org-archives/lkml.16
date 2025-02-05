Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23BA22B59C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751138; cv=none; b=RX83Ld5pZG0EYWWh699aYqiGPZdJ/61JbxsVwcG62Hy2DaDUeSZWdAwYMPpBt2beDx1bshDMjsatvTK7LxjpnwVow3VaeR6sj2xo6yzmQtugNGt1zhj4eJf3aceZ4raWzOr9cKxoZ1ZTKinNYpDohDebemjNYV7Mdu87Q1k9ITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751138; c=relaxed/simple;
	bh=Vh/ANEgyY8n5fImb081ab42mhkj0zQrjYMF1NAwI1mQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=eu/sbzbooNeN6XxV8M/BugUa2UIetZFV/mJqJEMC7smgpD7HbfqPtTWsk644CTF+d6TMuLTFol8Wdzwg57+RtTuMCe+LS8PxXCGsOqirDDAmKwnCCpESaTN3bEO6MnxmrOwNbbZvuJwUsYjTZAqcdyCK5FucNoKmi5wOFrufwZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZP4lFCpd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZP4lFCpd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=gXbe8TsfFkdLWBnFeHNPgw4BSHCBxSKL0V50l6k/6n8=; b=ZP4lFCpdOvAnzPIJYu92SqLUYo
	A3T4p1chIChfUGzX7PfOZWmSNVQuEkEHgYivzGQzeq42s/XwPxeXxRd3cz5NIAE0W2ziITYEUdnqA
	k2E5rkh+X/BCTYPfee2LZlXWK9KHVW86Pyd2tqZjVGqacBPHIKPbvg4/+Eu7CwycoiZ0U2gfLPnf8
	Fg1Hjd75Cfl/3zL8Qdw0RCDWurTlyPCvML+AArntnIuEjsC8tbZjbHxKrcYqmrnEpknPd4RVeB7A5
	oi5/wMt4D4d17wrFyB9Z1RVz62D07ZYoGC6keT/PpWO9Xr8IlKe3wjXsuvee32xHEqRJa0P0wf3un
	qnCNJB4w==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb4-00000004GQ8-2J4c;
	Wed, 05 Feb 2025 10:25:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 033BB3085D1; Wed,  5 Feb 2025 11:25:28 +0100 (CET)
Message-ID: <20250205102450.458085859@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:40 +0100
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
Subject: [PATCH v2 20/24] perf: Fix perf_mmap() failure path
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

When f_ops->mmap() returns failure, m_ops->close() is *not* called.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6852,7 +6852,7 @@ static int perf_mmap(struct file *file,
 	if (!ret)
 		ret = map_range(rb, vma);
 
-	if (event->pmu->event_mapped)
+	if (!ret && event->pmu->event_mapped)
 		event->pmu->event_mapped(event, vma->vm_mm);
 
 	return ret;


