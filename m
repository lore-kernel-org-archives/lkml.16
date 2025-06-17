Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B632ECD33
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750174781; cv=none; b=sDTyDwAt6CBWoFLglh5GYbEvc3LdkHT3SASpPRzbjDh3a3noK3ZmzO0ueEEIL+QDvNcI+X/2+lrogb8PvkeDSLpGOYS2zbNaPLngq3WCrlbYD/49VeLTv+5bUWvjT2PWtX5TIXNAcnndwmI+6I3QIDeNPC/tUp2GACpbeAYeTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750174781; c=relaxed/simple;
	bh=SoBgdJWVL/YyJ5lRVZiX0pURqAgt+HDpb32YuRNySoY=;
	h=From:Date:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=pCUBpo6vGaClADRhGVl2mySLy88Wx9ToR4d6AMM1uFG+IH4vfVDhJgMO2d3FIWWdnMSeTSD9Y4QFJ+n3ovAz0Vq4we7gz5sZv0Eps0FxL6B6BYhkwGAoDlBfegTVoGpYi+OClpQGxBD+9xp9FYkVek/OQHSivcSIwZ2I2hoVXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=PHnOJzmk; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="PHnOJzmk"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fad3400ea3so57844686d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1750174778; x=1750779578; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EsUdiJ0kNwQ30z0MOSU7iRuma44RnvYqkTl7miNkErI=;
        b=PHnOJzmkP0pxrOn6QIcVgcJ4PyZroyvyMhm1Quw8VzyuwAm0lpnUKPatuoZCEobOS+
         uVh36k7fC8uJb8cimq+bLPSv9/RUABOE3nla3OYfQqD7FqUSf7/lkdD5j8JHYthlsgw4
         6xOFGfQwl0ftkg0RwpeWApgpmidrx6fuHa/tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750174778; x=1750779578;
        h=mime-version:message-id:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsUdiJ0kNwQ30z0MOSU7iRuma44RnvYqkTl7miNkErI=;
        b=XWgTXGqr1kVY55cz2Czgeexzn5cgdIt3mtNiY/IlXpiX13ENv+vzQos4+7qs3ICrNj
         AurXP3zOqXhQmHPutI3HWe1F5qgh3RGRCRYcmx8f8rJCNsm+ShBTZMApNW7vZCHb9yGq
         k9GggYhGM1ZqMLU1p7Uy21PGxo2cVUCoQChIKW+JVvcWLRifRX/hn/SOsS/o4hje8UDX
         kbKkNqRJlL52z9lkYFuSAYZy8+yGyy8yLIpehJ0V28M5ZmsD2rEHlOp+JBj/ir1Ii4WT
         JU3oYtpl4E3ZzFPR2VVsJDfQqHez/7T5oH1giHIpE8kvNrlnG5AAyDo2YcH0tXx4JITm
         6JTw==
X-Gm-Message-State: AOJu0YwelJrPMU8tcWkuU6qNifrY2+VTRU892GpVuRpJ3hveTTnYwH6Y
	1xBzP052hnCPlfMZB7YPDP3OQewJk7ExXYastraAvoq8KJizDz9l+9r9iZgu9sOz7SQcC94F51P
	W6po=
X-Gm-Gg: ASbGncub/fv8OWEb137S7e82G4pTGZdSmsgHQ4RlEK9EulLWF8dFcQ/Z4Gy289iuLoc
	UEZvJwbIvcFsAylW3jE8DlWj7UXA62kXehrmJ7puNK78SZXj8wjU/BNfMANtmyPVQV3ms1bDPOt
	Caa3cN16xZS9QQQoFzAF7z+O2XdlJUWMqKkC+RlfKRyTVMT3z7YJva97GCwgiTArsMt95gng/wW
	1O9/FmAsRGPorX7SnoW8G1o9OawXKDu0Wi+SrsJkQNEXWZCZwJN8e46wziRiFjDqTd0cWNExu/y
	ldaa0ZJKwmXPvGSFj44YcJh1vxO01OVzpf0/Rg9KQ8cIT6NFlnooaEd8kqmmNFnqkWRJP6ezWpj
	sGkE7rDrx7ajKtUau
X-Google-Smtp-Source: AGHT+IFUfgfh7b7mzwn4MlIL7r49B9k+Sq/a0mEQZaAVRJo8RoiyLZUGSTkHebiAVaqEymT5wZtBFw==
X-Received: by 2002:a05:6214:cc4:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6fb4779f7a5mr183743736d6.38.1750174777973;
        Tue, 17 Jun 2025 08:39:37 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb4d210c19sm35252496d6.32.2025.06.17.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:39:37 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Tue, 17 Jun 2025 11:39:36 -0400 (EDT)
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
cc: "Liang, Kan" <kan.liang@linux.intel.com>, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: [perf] unchecked MSR access error: WRMSR to 0x3f1
Message-ID: <14d3167e-4dad-f68e-822f-21cd86eab873@maine.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello

When running the perf_fuzzzer on a raptor-lake machine I get a
	unchecked MSR access error: WRMSR to 0x3f1
error (see below).

A similar message happened before back in 2021 and was fixed in
commit 2dc0572f2cef87425147658698dce2600b799bd3 so not sure if this is the 
same problem or something new.

Vince Weaver
vincent.weaver@maine.edu

[12646.001692] unchecked MSR access error: WRMSR to 0x3f1 (tried to write 0x0001000000000001) at rIP: 0xffffffffa98932af (native_write_msr+0xf/0x20)
[12646.001698] Call Trace:
[12646.001700]  <TASK>
[12646.001700]  intel_pmu_pebs_enable_all+0x2c/0x40
[12646.001703]  intel_pmu_enable_all+0xe/0x20
[12646.001705]  ctx_resched+0x227/0x280
[12646.001708]  event_function+0x8f/0xd0
[12646.001710]  ? __pfx___perf_event_enable+0x10/0x10
[12646.001711]  remote_function+0x42/0x50
[12646.001713]  ? __pfx_remote_function+0x10/0x10
[12646.001714]  generic_exec_single+0x6d/0x130
[12646.001715]  smp_call_function_single+0xee/0x140
[12646.001716]  ? __pfx_remote_function+0x10/0x10
[12646.001717]  event_function_call+0x9f/0x1c0
[12646.001718]  ? __pfx___perf_event_enable+0x10/0x10
[12646.001720]  ? __pfx_event_function+0x10/0x10
[12646.001721]  perf_event_task_enable+0x7b/0x100
[12646.001723]  __do_sys_prctl+0x56f/0xca0
[12646.001725]  do_syscall_64+0x84/0x2f0
[12646.001727]  ? exit_to_user_mode_loop+0xcd/0x120
[12646.001729]  ? do_syscall_64+0x1ef/0x2f0
[12646.001730]  ? try_to_wake_up+0x7e/0x640
[12646.001732]  ? complete_signal+0x2e8/0x350
[12646.001734]  ? __send_signal_locked+0x2e3/0x450
[12646.001735]  ? send_signal_locked+0xb6/0x120
[12646.001736]  ? do_send_sig_info+0x6e/0xc0
[12646.001737]  ? kill_pid_info_type+0xa6/0xc0
[12646.001738]  ? kill_something_info+0x167/0x1a0
[12646.001739]  ? syscall_exit_work+0x132/0x140
[12646.001740]  ? do_syscall_64+0xbc/0x2f0
[12646.001741]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[12646.001743] RIP: 0033:0x7efe86afd40d
[12646.001744] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 18 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 9d 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 1b 48 8b 54 24 18 64 48 2b 14 25 28 00 00 00
[12646.001745] RSP: 002b:00007ffcd6444cf0 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
[12646.001746] RAX: ffffffffffffffda RBX: 000000000000000e RCX: 00007efe86afd40d
[12646.001747] RDX: 0000000000000001 RSI: 00007ffcd6444d24 RDI: 0000000000000020
[12646.001747] RBP: 00007ffcd6444d60 R08: 00007efe86bc625c R09: 00007efe86bc6260
[12646.001748] R10: 00007efe86bc6250 R11: 0000000000000246 R12: 0000000000000000
[12646.001748] R13: 00007ffcd64471b8 R14: 0000559eb2a2edd8 R15: 00007efe86c30020
[12646.001749]  </TASK>

