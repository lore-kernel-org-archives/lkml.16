Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CA2356C4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346897; cv=none; b=pXipxj86UvPqugQpC6aRe3o3iilqt5C1t1tBuogjmXPwJ8TFKq5/xSkMJnOkw3Gm4edfkuyhkQOLIFAb88a/95RyEBiaQfsiOK1w1S1/vk75AgYa6mfHwcluyqcak3E7sJ3OdJmaaHCGCFhTvA+S1fxn7uWbAqjuxlpniJK4LNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346897; c=relaxed/simple;
	bh=VYl+vCyFrcN1xt8fF4+m11+iBRz4CZ5mcCYoL8oFYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnIY0deVRCZ/8qoj7zKhrhBB3R6iGSKM25PXD1BcjL82OqG67rMaEwpVu8M/LbupKngIrh8qQN28ErHSxSPhUWz4ueumxCQoyktJWUMG9sUipA1NTZ4b5C1PUeJNHWdoIpPlRPLjzW+DRpybl8bla93YpuZnNN5KDLPLeV7C5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=afnkOonQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="afnkOonQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2347b7d6aeeso16038045ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748346893; x=1748951693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYl+vCyFrcN1xt8fF4+m11+iBRz4CZ5mcCYoL8oFYzg=;
        b=afnkOonQHV1IwHHgRGgrk3S1+14N1WsH+c9GYL0rrMkiRzdMLz4pmJhOEFk/GGLtqa
         cjGKHRAWLVDR16fJNQgnBl+4/EWnRKUbqZ8qJOhsIFQyFMfyKqtEsf1AmYJpAC+2fDVu
         7tmFdTO6z57CuzxMzZD2cGuYs6dRDhwXSqCB260B5QpFRu4SGFVAdmPgbb4MMAoeNtuW
         EiEzkAcXJDJCSOYpk3fzhyJb6/9BXIEi3Ogrli3Jh4qH2NzkD44Dl6xZe8SSBdy7Kz30
         +QhMtw30YtFa2qep8o6/xLCVwUKCm1EDWBgKoKRH4Nm4Z/GJkxullAe/jD3SzSQljsKr
         eprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346893; x=1748951693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYl+vCyFrcN1xt8fF4+m11+iBRz4CZ5mcCYoL8oFYzg=;
        b=ouPHQf9DlDgaPecFGJ/403rz6HCd50Chq0UYHYMXZ+mfFSx2yZw94leAJxZYV3Ljgl
         3HfbQMlj+cEgGlYaCQA0q22WxljXiC0CAg5tQ4/wOVW8I3SwIC/KJCaYTvURN6WTfYVU
         hsvo2Gkl67yBajC3g+D0CExuYtHK98tH2PisMWhho4dWDfI5YCKXv0Rb5IeEc4hzEDOa
         MhIidjNEDRUfH+phfpyeNj3eDvC4CezBm73bbgOx93Mk4XsMmXSq81FxelnCIITkQRES
         lC83HnGs7eZRIJ17cHt48CsWsCQKJ6oHwyHQkQ4UA8CMkvmEzeb3c7I3y3gz7dvRqLsg
         awFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvhBuM5GNht0B2kZvkacUL7p7oo4JYwXxzLIdIhnKz6NQrKahmGzbdNXy+fVbQH1UckIcip7Vv5Di47l8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4mg832UD1J1WdIfboY0k+GdUVdNKHuE2NXc5BeqlEGSTQ8VC
	AOeitwPi4iOw1MMlfzKc78bbs+lfsMdMYFq8TwQufo1HeN0HW7qnYgA4AUqIM4uTbg==
X-Gm-Gg: ASbGncuqN34tQTb2k2qm0Q80rJouvVlPafFT2aY66kOCGpaKahhrSbiHun12tajPTJt
	xI6UPWqx8JILXOzjjn0DRDkDdqwrO2odXVTsN+D2iH+HoIbmyDdPsj/2CYwHGF7KcUoHu0y3aPt
	Qz+5R+T4Phauaipp0SmXKkt3KW8FP4NrMtK68q/Kwq3c+Hn8hsuR3WLz8dZXi9qJDcPzFRKbNru
	TZ+q95s/mxuBdf28VvbhV2vMthOHFLltvdgUbUlY4IEvDolugsso7MtRZQxwl9LOo7srlL4uOmz
	2xj3Jux5YhlFYc0iAvDEl6DoYRhPvGcIA2qUapGFca4wloP+vBs=
X-Google-Smtp-Source: AGHT+IGMLSBCEC1K2AFmTBTG1jYMX3b3vNnIJEkwjTwnkBkTVP2uuG1JMTBetq4tdwf8el06Sl34/w==
X-Received: by 2002:a17:902:f54e:b0:234:8ac5:3f31 with SMTP id d9443c01a7336-2348ac53fd2mr61286695ad.23.1748346893548;
        Tue, 27 May 2025 04:54:53 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340934d91asm62983655ad.166.2025.05.27.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:54:53 -0700 (PDT)
Date: Tue, 27 May 2025 19:54:41 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250527114245.GA3578119@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
 <20250523145942.GL39944@noisy.programming.kicks-ass.net>
 <20250526113352.GA2993700@bytedance>
 <20250527065836.GA3373486@bytedance>
 <8501f4a8-8480-477e-8ab1-1d7796b978f1@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8501f4a8-8480-477e-8ab1-1d7796b978f1@amd.com>

Hi Prateek,

On Tue, May 27, 2025 at 04:49:36PM +0530, K Prateek Nayak wrote:
... ...
> Since we now have an official per-task throttle indicator, what are your
> thoughts on reusing "p->se.group_node" for throttled_limbo_list?
>

I'm not sure. I can easily get confused when I see se.group_node and
thought it was something related with rq->cfs_tasks :) Maybe using a
union could make it look better?

Anyway, if space is a concern then this is a good way to do it, thanks
for the suggestion. I'll leave it to Peter to decide.

Best wishes,
Aaron
