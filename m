Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14228312E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405229; cv=none; b=itLey+q/VTC/4ihvfrjUmbHZspza9tzMrmJtP+WQqi6Q8wVqy5IzrHHyszVE+T4+MNLYNTlmNC4+AGeN+H1EUVO1aZbdoXFNleHdE//vdeO2bwHSoAvYM19XGnJd78Wy9B1+B2LdoFBePWTj65Fz/GZh2V8hwR/2+jZeAXkQr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405229; c=relaxed/simple;
	bh=DzHFQiPQddZhawDVWcu2zeji/HBrjV6FWP4sfK+uAb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Em1Vf03wluIHA5RuUYbQfk2OhH7XjMbdIETRrP36MGtYNGhxQBBHQiF2aj2lmJGbBBlUAdE17T95rpmOBssgnbd//sxNOvCWjBGcxbX+l1F2cGOstBu2dnz2OO261v0/OjNHtJlq8qg8BNhOF8ygx8NX86n+cV75+qG89263o4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bpGE6hwq; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bpGE6hwq"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faf66905adso29960456d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751405227; x=1752010027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAN/JX9tNQneTS1/E3rAZ4/N5hA30DPl50YRPjyH77Q=;
        b=bpGE6hwqJSmzX3XACM6R2azq6Fjmun+PnGQVEedzLPC6JUGT9Zu6V83jLFzSLk/WEV
         rHL8m5VfOVRiOyH1J/d8dsJLuW3VZZfj5oGA/cUztX8WLPwIxvihAk8ERBvoRYD6klRl
         UHaUB4L4Rp5lBBJzWBHaxUX11Ow2welQTaWi65pByyyNx8QtXyhbxF7jTw0BdQE9Fudp
         3wX78YsnRHN7IJWtkLJtGI/SBkLthwYj/w+mjhV4F9NfWOFw28Whk3oYcLjaT+oIlyZi
         Ozg/uCtcozgWE4Wgrm6Jfsrl4+DS3R4w6/8n2Q3onsnXEf6iffmxSPR3fQSlltnZTpst
         t16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405227; x=1752010027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAN/JX9tNQneTS1/E3rAZ4/N5hA30DPl50YRPjyH77Q=;
        b=S4GvXySmSLXoRht8Phwk7aakcB0HRrQ1ETzWmldht6IMB7qS7S9r9iGxTsSdpjpuXm
         /zk4K6vyYscfM32Cuc7G94Y8g8Nv3n4r9A0LaTIB4M2ki8W6TF2cJBVQdeJ2Muw2k+BS
         9hcV0me+hkOddSLtVYPN/RKHgNc8z0fnacWM3uIwLqpkL0uOMNAR/Yuj5BggJa7v4EIi
         59kAhAZvbCEPEFaAKiqwtu+ovrfZGtZyCw7Fvj0JwKaEsrber1XBZDi2EG/dVQ+dePh3
         2gbuOIbKnuV6ip5IEnj0eleg6j1PiyKvxjrQv0M2VbTVvlcLlmHu5rud9jzmbOfPnDeV
         OkEw==
X-Forwarded-Encrypted: i=1; AJvYcCXZcVoWKQfjTUcHvweQvJfrC+By+R+uJXZ6u5MhekN40Li+OnX+e6TRwJVNO5CAqDFh2bSJq4c+f+YIqck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMKcSIgdd2NjQXluoz8/O4BmqitrqbeBj91mLJt/Mmnpkw6RG
	443H7W9E6suAMSxhed4TTrLQ242/j6FXfasO7VKy9i19oBPM5uGAhbl+EBffV24hmuI1Xo4nS/+
	Zu/gX/gHDUM7eWNk+LwABEY8n1u3Wnfx/oT7C5HWL
X-Gm-Gg: ASbGncspYqn4+Kj5wB4+ghpxxLtAuv0d2D2ZjVb3Hm4Te1I0SLT3or2kmSyhO9rNYRU
	DLFJwEneeJGdsQLcqv8YrwSWXjPGAMoT6gDEuhNCAzqmTGzJ3KRnoH2uI8xKf7KsqT6ZbcgsugK
	6LVpHm4wJ/avlXeES06v2kN4WozrjZa9rDkXHRWl30dolEIqdVZaA5G2cJRObN3LhTSPMLp4KvB
	A==
X-Google-Smtp-Source: AGHT+IGA7WQ+e3XksnB6m51usyyvNfN+MXcxbddeJ/9KeHNUIOLXzuYXqSKDJLS8QQzczdjQx/nSEiEiD6ZJ/P7pVhw=
X-Received: by 2002:a05:6214:c22:b0:6fa:cb9b:a793 with SMTP id
 6a1803df08f44-702b1aef861mr2025266d6.26.1751405226231; Tue, 01 Jul 2025
 14:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626-kunit-kselftests-v4-0-48760534fef5@linutronix.de> <20250626-kunit-kselftests-v4-7-48760534fef5@linutronix.de>
In-Reply-To: <20250626-kunit-kselftests-v4-7-48760534fef5@linutronix.de>
From: Rae Moar <rmoar@google.com>
Date: Tue, 1 Jul 2025 17:26:55 -0400
X-Gm-Features: Ac12FXwG0XmNtlAv7hUPU9jHLcT8Tyd4GL9zm8DXnJELkX1C01cyvv9A2Y6Bosg
Message-ID: <CA+GJov6boJrF25-3RXJHzSUvdX49J-UtmMaLTzeV8uLB3LY8og@mail.gmail.com>
Subject: Re: [PATCH v4 07/15] kunit: tool: Add test for nested test result reporting
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 2:10=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Currently there is no test validating the result reporting from nested
> tests. Add one, it will also be used to validate upcoming changes to the
> nested test parsing.

Hello!

This patch looks good to me! However, most of the tests in
kunit-tool-test do check nested test output but we do lack checks for
failing tests. Could we change this commit description to be something
like: "Currently there is a lack of tests validating failed results
reporting from nested tests."?

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: David Gow <davidgow@google.com>
> ---
>  tools/testing/kunit/kunit_tool_test.py                         | 10 ++++=
++++++
>  .../kunit/test_data/test_is_test_passed-failure-nested.log     |  7 ++++=
+++
>  2 files changed, 17 insertions(+)
>
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit=
/kunit_tool_test.py
> index bbba921e0eacb18663abfcabb2bccf330d8666f5..b74dc05fc2fe5b3ff629172fc=
7aafeb5c3d29fb3 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -165,6 +165,16 @@ class KUnitParserTest(unittest.TestCase):
>                 self.assertEqual(kunit_parser.TestStatus.FAILURE, result.=
status)
>                 self.assertEqual(result.counts.errors, 0)
>
> +       def test_parse_failed_nested_tests_log(self):
> +               nested_log =3D test_data_path('test_is_test_passed-failur=
e-nested.log')
> +               with open(nested_log) as file:
> +                       result =3D kunit_parser.parse_run_tests(file.read=
lines(), stdout)
> +               self.assertEqual(kunit_parser.TestStatus.FAILURE, result.=
status)
> +               self.assertEqual(result.counts.failed, 2)
> +               self.assertEqual(kunit_parser.TestStatus.FAILURE, result.=
subtests[0].status)
> +               self.assertEqual(kunit_parser.TestStatus.FAILURE, result.=
subtests[1].status)
> +               self.assertEqual(kunit_parser.TestStatus.FAILURE, result.=
subtests[1].subtests[0].status)
> +
>         def test_no_header(self):
>                 empty_log =3D test_data_path('test_is_test_passed-no_test=
s_run_no_header.log')
>                 with open(empty_log) as file:
> diff --git a/tools/testing/kunit/test_data/test_is_test_passed-failure-ne=
sted.log b/tools/testing/kunit/test_data/test_is_test_passed-failure-nested=
.log
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e528da39ab5b2be0fca6cf91=
60c10929fba3c9e
> --- /dev/null
> +++ b/tools/testing/kunit/test_data/test_is_test_passed-failure-nested.lo=
g
> @@ -0,0 +1,7 @@
> +KTAP version 1
> +1..2
> +not ok 1 subtest 1
> +    KTAP version 1
> +    1..1
> +        not ok 1 subsubtest 1
> +not ok 2 subtest 2
>
> --
> 2.50.0
>
