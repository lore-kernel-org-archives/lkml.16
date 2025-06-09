Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7B0881E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506706; cv=none; b=Z+6L7ZWrfwSeYqg3/Qv8pAcb903Ky8seBMJBrrONrDvy6y3GiTRD1kAVgd0fpl3n8p5+3jfP7msUHuSFWw/xygmFPocmr4yalDqrrSudXe4XVAcAtFKgb+LTzZMcDc/6QiXyRt6ZtpSHrFfzQWZf88C74R0oFU82bocnkmTG3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506706; c=relaxed/simple;
	bh=fMOL5dh/jsD5vXb2I0j6puGyNJ1BF+2FyJxTArfkPEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rumXBJOEb/vBiOIeZG6rWhuDsOtAqtF1tYjVDOJG339OaW4k9zgZFuLzoiN8pMoVNsq4vqXCZebRwZN9V6WOz/AQndzuTbQtEDf+NaxwF1VMorjb2HP0/E0PhhLG0+eRblmG9Zhz+u6Ib4saA8Eoon2dG/xCZI4JbY+xN0yKjd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id C8C6212049A;
	Mon,  9 Jun 2025 22:05:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 922B720011;
	Mon,  9 Jun 2025 22:04:59 +0000 (UTC)
Date: Mon, 9 Jun 2025 18:06:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "kprateek.nayak@amd.com"
 <kprateek.nayak@amd.com>, "vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250609180628.3d7143bc@gandalf.local.home>
In-Reply-To: <20250609175251.1fc90ca5@gandalf.local.home>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
	<20250603233654.1838967-2-prakash.sangappa@oracle.com>
	<20250604103106.1465f847@gandalf.local.home>
	<20250604145433.KCPMF8zm@linutronix.de>
	<80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
	<20250604192327.sVjt6c4u@linutronix.de>
	<20250609165532.3265e142@gandalf.local.home>
	<20250609175251.1fc90ca5@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 922B720011
X-Stat-Signature: x8ouwdxe13ei6qoogbbp849tucwqqnu6
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/HWdpyzCMCu3enu0xxd9kDgGa1e7Rp4Ac=
X-HE-Tag: 1749506699-653167
X-HE-Meta: U2FsdGVkX18PTKiRcCf3gbxrxo5oMIy2ilWKzqgKF5HUKxw/4Id7TtKYMtRAvwJU/kppFlVGwAI8WiqJkQuQ7DJ0OVVDpjTM1GaSlRXdB1J6qcGbm0eyRyjAjxYlEp86lAnfDnsPJCEMPBBvYSd7SjL1j7BKfRGsKFMOAmrseZW3u7EPdGzgA4+2KmT6TLp1OZ7WljCJlU34UxVSOEAxNQleuheTlz3pojJxQtSScBgdejLOC86Ig1h4rkC8lD36GMGcprfL3uEbT2U1qZ9UU+QwBaGK09w2fE9jz2F0aUUCTJpXtqxZ0rluuMPTqA6MMtzjBE9CXaJRmXxJhKlpHx/Y1qgI35M+6CF5C+yWwY++OLsVFGyo+sBtHy22V2y9UmdyUNiJ35/auKLqw9gyD57Nk9AYu7TE

On Mon, 9 Jun 2025 17:52:51 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> // Run with: GLIBC_TUNABLES=glibc.pthread.rseq=0 

You can ignore the above. I modified the rseq for my original version and
had to use a custom rseq that gcc didn't use. Although, since I was using
reserved bits, it probably didn't matter.

-- Steve


> 
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <string.h>
> #include <stdlib.h>
> #include <stdbool.h>
> #include <pthread.h>
> #include <unistd.h>
> #include <sys/time.h>

