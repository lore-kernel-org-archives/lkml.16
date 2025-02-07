Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A8F1802DD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947143; cv=none; b=ug8hcFSdFDyzReX/EaDIQLz6lrTDSsuwnAC2L3GUXWQRy25yOiTgLgcJT2+tZ+g6Y5ybeuKNqmO3aU9Fr5l/MPRpD2HMeIJkvreBa3KAlKplwJdNValXCh9SDrGayWjzfeNMv7crflhBZ9gWyhZlluol/urL0+Z4X7oTHzXZt44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947143; c=relaxed/simple;
	bh=lBczyWVcEwxF4Ttj3nziaoQ4DK0ZpgMsW5CwuhpOyMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6k2K0tdl4DS2spGfqUbEEILuEhlAI0vIJAS1fvr48IKYruUPKdAuhqnfzew5OADeYeXguIfOVTPjb11vvZMyZnQCwHh0O2YGWVOijZNKj5tWpK9hheb7PzwGcIG40ghHwR6Bn4D3Uth0CnUyUd2B/i+tC0vZEFkgVxdp+u0mZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1onWQ2n; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1onWQ2n"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d146357fb2so80085ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738947141; x=1739551941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaQn6K7jyorHitw/wTj9hI+PJlPLgdCagiVogzW2LvQ=;
        b=v1onWQ2n7gFHKO2n+7GHoyZNmEsJdd7nIhrBrpE7XqoeTaAg83PnbPCfUiPy5B+ovx
         xfPYIcF4c56f/YBLELhAGJgWqE+ALTG+92kAytniHc8TFOy2G72E8BN5fbeKtK3Qi5Ao
         eR9k7TuM7XeKHQ62bea+DfCuKjmgATNtjMPU2nsw5aHWqlx2Udx9YLum9VxW1EGUPDbp
         5YnONKaG5AUbWHOu0fzXetCQI4eeG4C3isst/Z8IzxWT/VlYsil/11bSPRomBqX/bsxZ
         zhHt0FeD/ADDIDDsZqd0KN1wn5iT8ezdVeeU67InZsBCqwkCSWcseWdB1ZZFs2juEzNt
         6WDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947141; x=1739551941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaQn6K7jyorHitw/wTj9hI+PJlPLgdCagiVogzW2LvQ=;
        b=nDEmn7XZ1nY+w2mLMhKcoamkOEjpvDaprD+qCnIEIfKRQ7V1gYve+FoMxsyFM5nQxk
         FXE16oR3wi0Yz/T+4K6UX/CYrECo6/ZmI6vBZFGBoNOJZYRYeFELU2m1DOguExUgJMTt
         8XfntZN4PLId5FCVpoYuv9krsS8yLOUBpvG3bQP/o0q4JIKDZIuwloeSGcZ5dpLU1bfz
         WqbFxahifsfCCaEVWXW963PsLAQDZ7XXa1y+bAbheO30XJoCxiW8z/0m4Q6PAtbzPn8M
         oQvoRX9PHY4Sfac0i27wmDBBX+asA/1bM1ClMVCOioUy3jFQ57ZhjdJJItWGcmVccogq
         PGPg==
X-Forwarded-Encrypted: i=1; AJvYcCVPZ+Db4aOtDvxQTNxVcC8D2mshddRn4fnQHzVFFgqNuKMNl0hR7PU2T7BWCRlsqwHnU6OMj3ZCPbU7r9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGBzF8/XBhyrDN3zpdppFa7xSqfSpzSyhhHx3J4EZnYta396u7
	RJb0oR3QhgWtS9quPQAYiPrrGOzN0ZucW8F4ddDPjLVr3O6pimJv1fKi2Lz0tt7WuNKTeUzw+fe
	lbCL+SJcgBRm1fHYdh+hhsfspX542apPDOpFk
X-Gm-Gg: ASbGncsiZKZc4laZqSBrjSYLr51OLqqPJbln+eWu0SjfwIhNqHftnRpnrsnl5Ux2UjQ
	L5/W01xlGZOhGjQKr7s9Ina1IB/Shg/hUbx2wbffS5wKbIaF3j4NG380Mm1/L23RDr93fHkX8zQ
	==
X-Google-Smtp-Source: AGHT+IH+eccZeVWVRooHatPRWms97tl2ixYWDBvCtisUhE2l0dgUs4cNDVp2DO8WirI/llb9F18uQzOyaVmYC+rKfN0=
X-Received: by 2002:a05:6e02:1c8a:b0:3ce:3873:48d4 with SMTP id
 e9e14a558f8ab-3d13def5cebmr4524575ab.4.1738947140907; Fri, 07 Feb 2025
 08:52:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207152844.302167-1-kan.liang@linux.intel.com>
In-Reply-To: <20250207152844.302167-1-kan.liang@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 7 Feb 2025 08:52:08 -0800
X-Gm-Features: AWEUYZlD4rHHScB2ecuCe1drW1pyGKqdAiE92k6K4hUGUg3ZtHT9u6XBaEP-kI4
Message-ID: <CAP-5=fWoRhg6eY8OEhKA-TbWb42pOZiiDF1PENuu5dHPMp-dpg@mail.gmail.com>
Subject: Re: [PATCH] perf tool_pmu: Add skip check in tool_pmu__event_to_str()
To: kan.liang@linux.intel.com
Cc: acme@kernel.org, namhyung@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	thomas.falcon@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:28=E2=80=AFAM <kan.liang@linux.intel.com> wrote:
>
> From: Kan Liang <kan.liang@linux.intel.com>
>
> Some topdown related metrics may fail on hybrid machines.
>
>  $perf stat -M tma_frontend_bound
>  Cannot resolve IDs for tma_frontend_bound:
>  cpu_atom@TOPDOWN_FE_BOUND.ALL@ / (8 * cpu_atom@CPU_CLK_UNHALTED.CORE@)
>
> In the find_tool_events(), the tool_pmu__event_to_str() is used to
> compare the tool_events. It only checks the event name, no PMU or arch.
> So the tool_events[TOOL_PMU__EVENT_SLOTS] is set to true, because the
> p-core Topdown metrics has "slots" event.
> The tool_events is shared. So when parsing the e-core metrics, the
> "slots" is automatically added.
>
> The "slots" event as a tool event should only be available on arm64. It
> has a different meaning on X86. The tool_pmu__skip_event() intends
> handle the case. Apply it for tool_pmu__event_to_str() as well.
>
> There is a lack of sanity check in the expr__get_id(). Add the check.
>
> Closes: https://lore.kernel.org/lkml/608077bc-4139-4a97-8dc4-7997177d95c4=
@linux.intel.com/
> Fixes: 069057239a67 ("perf tool_pmu: Move expr literals to tool_pmu")
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>

Thanks Kan!

Reviewed-by: Ian Rogers <irogers@google.com>

Ian
