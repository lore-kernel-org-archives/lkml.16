Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9924BCFD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215415; cv=none; b=pFe/UUWYER2RymR00qPkGw5pTR50yUc6Hw5cOB5RFSjWpzSPv1hyTmVq9kq0m4Wd+K0R5YXoUTlgXSBejJsrwuFbAYRy87BBeUtr3Iy3xykPL5viz1NFEWpvbh3ZBR1/fzhpekBH4HIPS+6G5dxncnJuai50wPlPCh9Itv7Cam8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215415; c=relaxed/simple;
	bh=BS8wCFJbHRJqkYtqoIWTi+QgcaGE16H2XbnIZNA9VPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZV5+4U4/CH3iFZ1/TaQ0IWIH1213SBVnjcFtleQ/zp9io1ohlWS5AThvzQLZha7P5vUxM+J0fQMRXkaUD8kZQQoBZekmGxBJpbCkOcB5NrRBDMSKAHcDoK8OQ9Jmh/SWyGm4yBFr0V7x4ta2iw94VAn2Jm6us8gULHJyEqwoVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UrXJ+dHG; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UrXJ+dHG"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d147331fb5so16475ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739215413; x=1739820213; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BS8wCFJbHRJqkYtqoIWTi+QgcaGE16H2XbnIZNA9VPY=;
        b=UrXJ+dHGsAc8iSShEW811toaiGt13hKz/q0okxskzv5gtbARvjK+fBrG1CQ8oJUUf4
         pnyQuAedWpHVhdGFFc4J7k7tvgUbHW9rTSD28Im6ZSpj5zlF3q9dXF5oO+Aav/bmPJrC
         hY+P7OcM8lBFQ8aX19pyg9Vpw9aRe3fQ3m1QXChSXiscBbFv0j401j6UoE7eSMK6cBdH
         2oALClPF1qjFzZPLp6QKXpuz9tJoWoL59Ufo1QWla+2W5+KVTZ9d/Tj50mIohtjWj6Rj
         kXljbcpn9o4FeCk3fGGvY5oLvG9NhXNEPGDREWbD8YNgWRbrZhqv8tCKftmyXocanUa2
         mziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739215413; x=1739820213;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS8wCFJbHRJqkYtqoIWTi+QgcaGE16H2XbnIZNA9VPY=;
        b=ap0uIWrn3lLtZ/En9kKnOulerwQJHBzuBF9kPkbyb5pkuTsxhhK7oN/n5q3jcMyWur
         SU3pTPT+Zw/eRnach3/MSV468n1xX57K3utFWQt6wmqQZNKWDYVHndlwzWgxmZ5klWZ3
         esO/01F74cUtybvuKGkTCbSRsqAi2Su1Oim7TvTd+tuuteLR5M9sTEvz1kyMsuX/4DZI
         z5rheGFoD0adf4TEndbCwA2Ny7oP4hEM4tf5cYJ+G6bVaL6hHKsuTYhH2eWqbFqmAHkB
         XUDfygrjx4SAR/npWyJfa39YxjL50WE74NI0igDV86WB9k0Zk4tiBUO2oLWclLsJNFaB
         Ewpg==
X-Forwarded-Encrypted: i=1; AJvYcCWtlVCoZVV8V7PbA286Gayp+1bN32oENApPvp5ZE2GwTI2OJyxI55PnIT8FYb3XO0XrGppbZCC7+U6U4pQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7yyCMx1AXgbpggd4jfMPsz7d4tRZNERf2rV8pVTXZ2nr/bVBR
	bftfITaWND0X+7P0OLh85fK9tDOVTHttHIKxkPC0wsd5NxOM+NZ96mYaGSqeM0jqeA6iq73sXrn
	be14WwgPEv13KjmfPseIWdwqPrHD7opbZ+Oiz
X-Gm-Gg: ASbGncvNbXLIFYL0bOKY0JaWfRAjSxL4ExNBP4cNzvKbl5PwJjXPhwie42V3bxm+6ir
	+uaZIOgXL3XdgH7bZ48G3tOR4FIbIev9+3VsCxFlsntICd+q63ePnDxYRn7SYs90SnGsSDLt8Bs
	fvn+tHJvkCOB4PGInVzDNi8/Yn
X-Google-Smtp-Source: AGHT+IH4QBrvzOcxvPMkar/gP/Um8LH1FrS4euE+Vwj+OJmo1p88lMRgvpVy8FYhzyn31tVt4am1TiL3z0tt7Ey2iS0=
X-Received: by 2002:a05:6e02:388e:b0:3cf:cb47:9963 with SMTP id
 e9e14a558f8ab-3d17036d434mr169655ab.25.1739215413262; Mon, 10 Feb 2025
 11:23:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109175401.161340-1-irogers@google.com>
In-Reply-To: <20250109175401.161340-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 11:23:22 -0800
X-Gm-Features: AWEUYZlqVCZLMtiy5hrxvQ-Q5BOE5craO8pQO_xiEl86uzRcCMz1ou50_0XDo14
Message-ID: <CAP-5=fWghT8+pBFVxn9JDbqHU9NPy9mgyT8Ee=pTdkCKxRoJgA@mail.gmail.com>
Subject: Re: [PATCH v1] perf parse-events: Tidy name token matching
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 9:54=E2=80=AFAM Ian Rogers <irogers@google.com> wrot=
e:
>
> Prior to commit 70c90e4a6b2f ("perf parse-events: Avoid scanning PMUs
> before parsing") names (generally event names) excluded hyphen (minus)
> symbols as the formation of legacy names with hyphens was handled in
> the yacc code. That commit allowed hyphens supposedly making
> name_minus unnecessary. However, changing name_minus to name has
> issues in the term config tokens as then name ends up having priority
> over numbers and name allows matching numbers since commit
> 5ceb57990bf4 ("perf parse: Allow tracepoint names to start with digits
> "). It is also permissable for a name to match with a colon (':') in
> it when its in a config term list. To address this rename name_minus
> to term_name, make the pattern match name's except for the colon, add
> number matching into the config term region with a higher priority
> than name matching. This addresses an inconsistency and allows greater
> matching for names inside of term lists, for example, they may start
> with a number.
>
> Rename name_tag to quoted_name and update comments and helper
> functions to avoid str detecting quoted strings which was already done
> by the lexer.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Ping. This patch addresses name parsing inconsistencies, in particular
events may start with a number without a PMU, but not with. It also
aims to give better names to patterns than name_minus and name_tag
(with term_name and quoted_name respectively) that have drifted from
their original meaning and become to me less than intention revealing.

Thanks,
Ian
