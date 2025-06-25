Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424201D5AD4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865530; cv=none; b=i7V3V2wh468T3EsPQ2ZrdYZdcqRrKknH1YfyDIS0zgAP3A5xdIb/a475rFlZnE1CZaaSmr50HPAQyFPGQdzwhFoBWboXe8S7w0OnscTLIhOB0cAeF3da/jX87Y6MlKiBY53sn/njJb9R395qQrBI1rTfK+DeXhGV5kT17FKIZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865530; c=relaxed/simple;
	bh=x6feCITrFhPaGclC8zFQ2HR1RuZnWD4n2DVDo7w5SLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RB+AhjtbEb3tcb7udhKKpATiXoO/FhMsGPb2zObWksS3pqYH3+YG94rJ7zLYfECqt1dJIRehU42Pv4LW9CGDs41bpNoVQnRwPt3WbZbuyhhOVEfMPYbsroQloJ6iPkvTmRrySnWywRbnoehSe415lEdd/LjVdQdEoGVuCupoTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkINNl6M; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkINNl6M"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c173211feso1886119a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865528; x=1751470328; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSbIY9Yl8vGdIuAQaYjHaIKe7rsAqaxI1VrCaxGNZw0=;
        b=PkINNl6MOv/ae6cm9mouEGJSDtwAfzwyVphShMnC7nlIVU4MGOzLM1F7WhSu/DKUJb
         vrzT0dHTK9IEg81Sh/sycODTBjzNDfuoOtc4P4z4/1KCwLU1Q7BOZfWxXIjVo4nM1MaE
         SU44gQyOizJ4qkq/Dgke/WqTpeQicmGXhwKoGZPXx568wp2EhZVISxLQ3/LYlCCNve04
         uWxMHnC0lWt8BklKCov0zxaQ9PlMYv7cDwJgV/xckoxO7LHSsQf3GQQUsJUj8R1ggXY/
         nrtHJjKksOo+NnX6lU5PIamRUw20gjZNe9wSBJJzIgrMZeqCFN2zy5+qX/ekU8XD0qa/
         i9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865528; x=1751470328;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSbIY9Yl8vGdIuAQaYjHaIKe7rsAqaxI1VrCaxGNZw0=;
        b=Pk3ZVmR1cNXAaaxP2vIIlvf/DFBe/hfi57aIJaPaLDLlPzCJ6e7vZ3nDtgjNZ/W4hh
         9uJ01liws2aVOsxbwLrLd6Q9WCh+eQkVeVyQwNug1Opbi1VBS69TDq5FOVk3q4EJ71LS
         YHb9OhSYe6ikOlY7NwZtq4hsSwxYFVUK54u/MZk51jhoel3GzLlGKaSpqxoPeHje5xI8
         /TvrnLYfZuvkwweReoxy2YLB6lTRmCgtfNAYPmEd3cFGvSAmTeQNOsEqGslL9sZaQwZo
         Z7LigCGYJxGkQ4GrxFCG1i/k26T6e/UOyNuDAS19Z5K4JlTEC8e1x3o0eK5rx8tIh3XD
         wAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkYVbuVowY0OItwwd0RVUvfz/4gi90HQlcD76DhTt/VOCbC4VdRDZ6I8S76RWDLI00StzOHTNnyhqBC/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmn0TE/eZTzgb2yOWufORHNQtPdB/Zx/NZBK4oiezhNjIiiQFx
	HIaZkkO16urwOKok7SYx7AV+8ZgvB4bBS3GKp140IOWmS88XOc/FZYkmJlM0+g/ijyQ=
X-Gm-Gg: ASbGncuuTsfwBd+/54axvPoYGg3F8hccU7uMJLbQ9Ij5FbEXm6rVMTL9MGSgIZSFzlC
	8n/IKbi2ne02KyO1IUlJgn8mIk342R7DRmKMXWfVgQ4TSMBfrah6DHFowabG8wMPFL/Jgg3CKK/
	W6zCWbwewUUU5yLE0nC8AY9iwh1VJhDEeBOpogKF8gsMnAXm3zDkCDBlTcrOh6wTOebNCpwSXGV
	2ZrOdomctOSMAKYS8gCaoVVuH4y2OUTSWLBTKLZzTiTrtCPFBYA6zn11pbdE6x0KrjCj4WX2N0j
	A5WORXBMFju9jmr0UUutsOD7BJr+3Jqw5Dk+0Lh/SRIhfQGDgNw0suzCBlB/UXKNsJc3jA==
X-Google-Smtp-Source: AGHT+IHnooEMEz17n4Y/kHC8fTdwEsKQiWCHXSACT92x6wJgEO1U5hoZYWd06+PlWgby4tspZtHXSA==
X-Received: by 2002:a05:6808:81d5:b0:406:6fd3:ff18 with SMTP id 5614622812f47-40b05c740b8mr2902678b6e.34.1750865528333;
        Wed, 25 Jun 2025 08:32:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11bd8sm2252633b6e.39.2025.06.25.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:32:07 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:32:04 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] mm,memory_hotplug: set failure reason in
 offline_pages()
Message-ID: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "reason" variable is uninitialized on this error path.  It's supposed
to explain why the function failed.

Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: I misunderstood the reason why the function was failing.  Use the
    correct reason.

 mm/memory_hotplug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4d864b4fb891..e4009a44f883 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 		node_arg.nid = node;
 		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
 		ret = notifier_to_errno(ret);
-		if (ret)
+		if (ret) {
+			reason = "node notifier failure";
 			goto failed_removal_isolated;
+		}
 	}
 
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
-- 
2.47.2

