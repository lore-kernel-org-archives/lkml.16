Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB51336B;
	Fri, 25 Apr 2025 00:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745539752; cv=none; b=tXopDjmC6Zw8BlQDFjYamPZzyqkjvzYPGVKge6vH/6PNHGdIzQq6oFy/YadkstAoWz9HmedE6IQxfafA7HOWB1sc/wA/p6jGGvXEqicn/je4YKdyORvUhkwDHCsbycyokr7TT1YVuuHL/vmeAG/QkdiXXjNtP4HYK/nygHdiUoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745539752; c=relaxed/simple;
	bh=0huZicQRmhJ413j62emJolan0/tKf9DMXW68xtV+dUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jXNehNBq1HpuqvJQBOcYsu7OcQQexBTjelP1GTCAZz2mqU/LJ6z0VRRmLjJaAHreb/xNfxQNLH5F9MukZdmm5yzGh9PtVDt1y7oyv4nnzn7drxbdr/oToAP2RaNQSjRzeOg9NKOTU63f4Y9xr6/DVKqBEMbnZnpkjKmEX9iqoZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nf8UErev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nf8UErev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A1AC4CEE3;
	Fri, 25 Apr 2025 00:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745539751;
	bh=0huZicQRmhJ413j62emJolan0/tKf9DMXW68xtV+dUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nf8UErevu94XHTRqVDdQj0Dt0BXBIX/GkcEv5pvhVuhXAKqMToxD8q4UlYHx6rOWg
	 8t1DkfmooWeBqq5hL6gbz59V3mKApTqeQV2PcOfbRCcPZFanROyEDaUN9Eb+tYB3Jr
	 xSEbbNd1BhTHIT90XhJLPIRLEopBf8LaxoBCr1+vdU2pbEa+2rSaarh/gDqk86m99D
	 qzaqq8Nm7WzqVP20hQYAfOrSpndHa0ZgEXBMM0ornsqxfY0QueJf2Z3pRSOqduMxKz
	 nOG40WPdCqCJOJp9cqBgXZBz16k9i8Nhx3JjaaLhoOXxokyMlyToc/kS/fGDaF/jB5
	 xrzJNxfixzAyQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u86cp-00000000R1e-3TyJ;
	Fri, 25 Apr 2025 08:09:03 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] docs: Makefile: store __pycache__ at the output directory
Date: Fri, 25 Apr 2025 08:08:53 +0800
Message-ID: <1b9e7f34c1d99a27a8abb308da3221b4663b5693.1745539360.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745539360.git.mchehab+huawei@kernel.org>
References: <cover.1745539360.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Instead of blocking creation of *.pyc cache, store python
cache under Documentation/output/__pycache__

Documentation/output/__pycache__/
├── new_devel
│   └── v4l
│       └── docs
│           ├── Documentation
│           │   └── sphinx
│           │       ├── automarkup.cpython-313.pyc
│           │       ├── kernel_abi.cpython-313.pyc
│           │       ├── kerneldoc.cpython-313.pyc
│           │       ├── kernel_feat.cpython-313.pyc
│           │       ├── kernel_include.cpython-313.pyc
│           │       ├── kfigure.cpython-313.pyc
│           │       ├── load_config.cpython-313.pyc
│           │       ├── maintainers_include.cpython-313.pyc
│           │       ├── rstFlatTable.cpython-313.pyc
│           │       └── translations.cpython-313.pyc
│           └── scripts
│               └── lib
│                   ├── abi
│                   │   ├── abi_parser.cpython-313.pyc
│                   │   └── helpers.cpython-313.pyc
│                   └── kdoc
│                       ├── kdoc_files.cpython-313.pyc
│                       ├── kdoc_output.cpython-313.pyc
│                       ├── kdoc_parser.cpython-313.pyc
│                       └── kdoc_re.cpython-313.pyc
└── usr
    ├── lib
    │   └── python3.13
    │       └── site-packages
    │           ├── abrt_exception_handler3.cpython-313.pyc
    │           ├── alabaster
    │           │   └── __init__.cpython-313.pyc
    │           ├── babel
    │           │   ├── core.cpython-313.pyc
    │           │   ├── dates.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── localedata.cpython-313.pyc
    │           │   ├── localtime
    │           │   │   ├── _fallback.cpython-313.pyc
    │           │   │   ├── _helpers.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── _unix.cpython-313.pyc
    │           │   ├── messages
    │           │   │   ├── catalog.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── mofile.cpython-313.pyc
    │           │   │   ├── plurals.cpython-313.pyc
    │           │   │   └── pofile.cpython-313.pyc
    │           │   ├── plural.cpython-313.pyc
    │           │   └── util.cpython-313.pyc
    │           ├── chardet
    │           │   ├── big5freq.cpython-313.pyc
    │           │   ├── big5prober.cpython-313.pyc
    │           │   ├── chardistribution.cpython-313.pyc
    │           │   ├── charsetgroupprober.cpython-313.pyc
    │           │   ├── charsetprober.cpython-313.pyc
    │           │   ├── codingstatemachine.cpython-313.pyc
    │           │   ├── codingstatemachinedict.cpython-313.pyc
    │           │   ├── cp949prober.cpython-313.pyc
    │           │   ├── enums.cpython-313.pyc
    │           │   ├── escprober.cpython-313.pyc
    │           │   ├── escsm.cpython-313.pyc
    │           │   ├── eucjpprober.cpython-313.pyc
    │           │   ├── euckrfreq.cpython-313.pyc
    │           │   ├── euckrprober.cpython-313.pyc
    │           │   ├── euctwfreq.cpython-313.pyc
    │           │   ├── euctwprober.cpython-313.pyc
    │           │   ├── gb2312freq.cpython-313.pyc
    │           │   ├── gb2312prober.cpython-313.pyc
    │           │   ├── hebrewprober.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── jisfreq.cpython-313.pyc
    │           │   ├── johabfreq.cpython-313.pyc
    │           │   ├── johabprober.cpython-313.pyc
    │           │   ├── jpcntx.cpython-313.pyc
    │           │   ├── langbulgarianmodel.cpython-313.pyc
    │           │   ├── langgreekmodel.cpython-313.pyc
    │           │   ├── langhebrewmodel.cpython-313.pyc
    │           │   ├── langrussianmodel.cpython-313.pyc
    │           │   ├── langthaimodel.cpython-313.pyc
    │           │   ├── langturkishmodel.cpython-313.pyc
    │           │   ├── latin1prober.cpython-313.pyc
    │           │   ├── macromanprober.cpython-313.pyc
    │           │   ├── mbcharsetprober.cpython-313.pyc
    │           │   ├── mbcsgroupprober.cpython-313.pyc
    │           │   ├── mbcssm.cpython-313.pyc
    │           │   ├── resultdict.cpython-313.pyc
    │           │   ├── sbcharsetprober.cpython-313.pyc
    │           │   ├── sbcsgroupprober.cpython-313.pyc
    │           │   ├── sjisprober.cpython-313.pyc
    │           │   ├── universaldetector.cpython-313.pyc
    │           │   ├── utf1632prober.cpython-313.pyc
    │           │   ├── utf8prober.cpython-313.pyc
    │           │   └── version.cpython-313.pyc
    │           ├── charset_normalizer
    │           │   ├── api.cpython-313.pyc
    │           │   ├── cd.cpython-313.pyc
    │           │   ├── constant.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── legacy.cpython-313.pyc
    │           │   ├── md.cpython-313.pyc
    │           │   ├── models.cpython-313.pyc
    │           │   ├── utils.cpython-313.pyc
    │           │   └── version.cpython-313.pyc
    │           ├── defusedxml
    │           │   ├── common.cpython-313.pyc
    │           │   ├── ElementTree.cpython-313.pyc
    │           │   └── __init__.cpython-313.pyc
    │           ├── _distutils_hack
    │           │   └── __init__.cpython-313.pyc
    │           ├── docutils
    │           │   ├── core.cpython-313.pyc
    │           │   ├── frontend.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── io.cpython-313.pyc
    │           │   ├── languages
    │           │   │   ├── en.cpython-313.pyc
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── nodes.cpython-313.pyc
    │           │   ├── parsers
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── rst
    │           │   │       ├── directives
    │           │   │       │   ├── admonitions.cpython-313.pyc
    │           │   │       │   ├── body.cpython-313.pyc
    │           │   │       │   ├── images.cpython-313.pyc
    │           │   │       │   ├── __init__.cpython-313.pyc
    │           │   │       │   ├── misc.cpython-313.pyc
    │           │   │       │   ├── parts.cpython-313.pyc
    │           │   │       │   └── tables.cpython-313.pyc
    │           │   │       ├── __init__.cpython-313.pyc
    │           │   │       ├── languages
    │           │   │       │   ├── en.cpython-313.pyc
    │           │   │       │   └── __init__.cpython-313.pyc
    │           │   │       ├── roles.cpython-313.pyc
    │           │   │       ├── states.cpython-313.pyc
    │           │   │       └── tableparser.cpython-313.pyc
    │           │   ├── readers
    │           │   │   ├── doctree.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── standalone.cpython-313.pyc
    │           │   ├── statemachine.cpython-313.pyc
    │           │   ├── transforms
    │           │   │   ├── frontmatter.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── misc.cpython-313.pyc
    │           │   │   ├── parts.cpython-313.pyc
    │           │   │   ├── references.cpython-313.pyc
    │           │   │   ├── universal.cpython-313.pyc
    │           │   │   └── writer_aux.cpython-313.pyc
    │           │   ├── utils
    │           │   │   ├── code_analyzer.cpython-313.pyc
    │           │   │   ├── error_reporting.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── math
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   ├── latex2mathml.cpython-313.pyc
    │           │   │   │   ├── math2html.cpython-313.pyc
    │           │   │   │   ├── tex2mathml_extern.cpython-313.pyc
    │           │   │   │   ├── tex2unichar.cpython-313.pyc
    │           │   │   │   └── unichar2tex.cpython-313.pyc
    │           │   │   ├── punctuation_chars.cpython-313.pyc
    │           │   │   ├── roman.cpython-313.pyc
    │           │   │   ├── smartquotes.cpython-313.pyc
    │           │   │   └── urischemes.cpython-313.pyc
    │           │   └── writers
    │           │       ├── docutils_xml.cpython-313.pyc
    │           │       ├── html4css1
    │           │       │   └── __init__.cpython-313.pyc
    │           │       ├── html5_polyglot
    │           │       │   └── __init__.cpython-313.pyc
    │           │       ├── _html_base.cpython-313.pyc
    │           │       ├── __init__.cpython-313.pyc
    │           │       ├── latex2e
    │           │       │   └── __init__.cpython-313.pyc
    │           │       └── manpage.cpython-313.pyc
    │           ├── idna
    │           │   ├── core.cpython-313.pyc
    │           │   ├── idnadata.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── intranges.cpython-313.pyc
    │           │   └── package_data.cpython-313.pyc
    │           ├── imagesize
    │           │   ├── imagesize.cpython-313.pyc
    │           │   └── __init__.cpython-313.pyc
    │           ├── jinja2
    │           │   ├── async_utils.cpython-313.pyc
    │           │   ├── bccache.cpython-313.pyc
    │           │   ├── compiler.cpython-313.pyc
    │           │   ├── defaults.cpython-313.pyc
    │           │   ├── environment.cpython-313.pyc
    │           │   ├── exceptions.cpython-313.pyc
    │           │   ├── ext.cpython-313.pyc
    │           │   ├── filters.cpython-313.pyc
    │           │   ├── _identifier.cpython-313.pyc
    │           │   ├── idtracking.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── lexer.cpython-313.pyc
    │           │   ├── loaders.cpython-313.pyc
    │           │   ├── nodes.cpython-313.pyc
    │           │   ├── optimizer.cpython-313.pyc
    │           │   ├── parser.cpython-313.pyc
    │           │   ├── runtime.cpython-313.pyc
    │           │   ├── sandbox.cpython-313.pyc
    │           │   ├── tests.cpython-313.pyc
    │           │   ├── utils.cpython-313.pyc
    │           │   └── visitor.cpython-313.pyc
    │           ├── packaging
    │           │   ├── _elffile.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── _manylinux.cpython-313.pyc
    │           │   ├── _musllinux.cpython-313.pyc
    │           │   ├── specifiers.cpython-313.pyc
    │           │   ├── _structures.cpython-313.pyc
    │           │   ├── tags.cpython-313.pyc
    │           │   ├── utils.cpython-313.pyc
    │           │   └── version.cpython-313.pyc
    │           ├── pygments
    │           │   ├── filter.cpython-313.pyc
    │           │   ├── filters
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── formatter.cpython-313.pyc
    │           │   ├── formatters
    │           │   │   ├── html.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── latex.cpython-313.pyc
    │           │   │   └── _mapping.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── lexer.cpython-313.pyc
    │           │   ├── lexers
    │           │   │   ├── c_cpp.cpython-313.pyc
    │           │   │   ├── _css_builtins.cpython-313.pyc
    │           │   │   ├── css.cpython-313.pyc
    │           │   │   ├── data.cpython-313.pyc
    │           │   │   ├── html.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── javascript.cpython-313.pyc
    │           │   │   ├── jvm.cpython-313.pyc
    │           │   │   ├── _lilypond_builtins.cpython-313.pyc
    │           │   │   ├── lilypond.cpython-313.pyc
    │           │   │   ├── lisp.cpython-313.pyc
    │           │   │   ├── _mapping.cpython-313.pyc
    │           │   │   ├── markup.cpython-313.pyc
    │           │   │   ├── python.cpython-313.pyc
    │           │   │   ├── ruby.cpython-313.pyc
    │           │   │   ├── _scheme_builtins.cpython-313.pyc
    │           │   │   └── special.cpython-313.pyc
    │           │   ├── modeline.cpython-313.pyc
    │           │   ├── plugin.cpython-313.pyc
    │           │   ├── regexopt.cpython-313.pyc
    │           │   ├── style.cpython-313.pyc
    │           │   ├── styles
    │           │   │   ├── friendly.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── _mapping.cpython-313.pyc
    │           │   ├── token.cpython-313.pyc
    │           │   ├── unistring.cpython-313.pyc
    │           │   └── util.cpython-313.pyc
    │           ├── pytz
    │           │   ├── exceptions.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── lazy.cpython-313.pyc
    │           │   ├── tzfile.cpython-313.pyc
    │           │   └── tzinfo.cpython-313.pyc
    │           ├── requests
    │           │   ├── adapters.cpython-313.pyc
    │           │   ├── api.cpython-313.pyc
    │           │   ├── auth.cpython-313.pyc
    │           │   ├── certs.cpython-313.pyc
    │           │   ├── compat.cpython-313.pyc
    │           │   ├── cookies.cpython-313.pyc
    │           │   ├── exceptions.cpython-313.pyc
    │           │   ├── hooks.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── _internal_utils.cpython-313.pyc
    │           │   ├── models.cpython-313.pyc
    │           │   ├── packages.cpython-313.pyc
    │           │   ├── sessions.cpython-313.pyc
    │           │   ├── status_codes.cpython-313.pyc
    │           │   ├── structures.cpython-313.pyc
    │           │   ├── utils.cpython-313.pyc
    │           │   └── __version__.cpython-313.pyc
    │           ├── snowballstemmer
    │           │   ├── among.cpython-313.pyc
    │           │   ├── arabic_stemmer.cpython-313.pyc
    │           │   ├── armenian_stemmer.cpython-313.pyc
    │           │   ├── basestemmer.cpython-313.pyc
    │           │   ├── basque_stemmer.cpython-313.pyc
    │           │   ├── catalan_stemmer.cpython-313.pyc
    │           │   ├── danish_stemmer.cpython-313.pyc
    │           │   ├── dutch_stemmer.cpython-313.pyc
    │           │   ├── english_stemmer.cpython-313.pyc
    │           │   ├── finnish_stemmer.cpython-313.pyc
    │           │   ├── french_stemmer.cpython-313.pyc
    │           │   ├── german_stemmer.cpython-313.pyc
    │           │   ├── greek_stemmer.cpython-313.pyc
    │           │   ├── hindi_stemmer.cpython-313.pyc
    │           │   ├── hungarian_stemmer.cpython-313.pyc
    │           │   ├── indonesian_stemmer.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── irish_stemmer.cpython-313.pyc
    │           │   ├── italian_stemmer.cpython-313.pyc
    │           │   ├── lithuanian_stemmer.cpython-313.pyc
    │           │   ├── nepali_stemmer.cpython-313.pyc
    │           │   ├── norwegian_stemmer.cpython-313.pyc
    │           │   ├── porter_stemmer.cpython-313.pyc
    │           │   ├── portuguese_stemmer.cpython-313.pyc
    │           │   ├── romanian_stemmer.cpython-313.pyc
    │           │   ├── russian_stemmer.cpython-313.pyc
    │           │   ├── serbian_stemmer.cpython-313.pyc
    │           │   ├── spanish_stemmer.cpython-313.pyc
    │           │   ├── swedish_stemmer.cpython-313.pyc
    │           │   ├── tamil_stemmer.cpython-313.pyc
    │           │   ├── turkish_stemmer.cpython-313.pyc
    │           │   └── yiddish_stemmer.cpython-313.pyc
    │           ├── socks.cpython-313.pyc
    │           ├── sphinx
    │           │   ├── addnodes.cpython-313.pyc
    │           │   ├── application.cpython-313.pyc
    │           │   ├── builders
    │           │   │   ├── changes.cpython-313.pyc
    │           │   │   ├── dirhtml.cpython-313.pyc
    │           │   │   ├── dummy.cpython-313.pyc
    │           │   │   ├── epub3.cpython-313.pyc
    │           │   │   ├── _epub_base.cpython-313.pyc
    │           │   │   ├── gettext.cpython-313.pyc
    │           │   │   ├── html
    │           │   │   │   ├── _assets.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   └── transforms.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── latex
    │           │   │   │   ├── constants.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   ├── nodes.cpython-313.pyc
    │           │   │   │   ├── theming.cpython-313.pyc
    │           │   │   │   ├── transforms.cpython-313.pyc
    │           │   │   │   └── util.cpython-313.pyc
    │           │   │   ├── linkcheck.cpython-313.pyc
    │           │   │   ├── manpage.cpython-313.pyc
    │           │   │   ├── singlehtml.cpython-313.pyc
    │           │   │   ├── texinfo.cpython-313.pyc
    │           │   │   ├── text.cpython-313.pyc
    │           │   │   └── xml.cpython-313.pyc
    │           │   ├── cmd
    │           │   │   ├── build.cpython-313.pyc
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── config.cpython-313.pyc
    │           │   ├── deprecation.cpython-313.pyc
    │           │   ├── directives
    │           │   │   ├── code.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── other.cpython-313.pyc
    │           │   │   └── patches.cpython-313.pyc
    │           │   ├── domains
    │           │   │   ├── c
    │           │   │   │   ├── _ast.cpython-313.pyc
    │           │   │   │   ├── _ids.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   ├── _parser.cpython-313.pyc
    │           │   │   │   └── _symbol.cpython-313.pyc
    │           │   │   ├── changeset.cpython-313.pyc
    │           │   │   ├── citation.cpython-313.pyc
    │           │   │   ├── cpp
    │           │   │   │   ├── _ast.cpython-313.pyc
    │           │   │   │   ├── _ids.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   ├── _parser.cpython-313.pyc
    │           │   │   │   └── _symbol.cpython-313.pyc
    │           │   │   ├── index.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── javascript.cpython-313.pyc
    │           │   │   ├── math.cpython-313.pyc
    │           │   │   ├── python
    │           │   │   │   ├── _annotations.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   └── _object.cpython-313.pyc
    │           │   │   ├── rst.cpython-313.pyc
    │           │   │   └── std
    │           │   │       └── __init__.cpython-313.pyc
    │           │   ├── environment
    │           │   │   ├── adapters
    │           │   │   │   ├── asset.cpython-313.pyc
    │           │   │   │   ├── indexentries.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   └── toctree.cpython-313.pyc
    │           │   │   ├── collectors
    │           │   │   │   ├── asset.cpython-313.pyc
    │           │   │   │   ├── dependencies.cpython-313.pyc
    │           │   │   │   ├── __init__.cpython-313.pyc
    │           │   │   │   ├── metadata.cpython-313.pyc
    │           │   │   │   ├── title.cpython-313.pyc
    │           │   │   │   └── toctree.cpython-313.pyc
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── errors.cpython-313.pyc
    │           │   ├── events.cpython-313.pyc
    │           │   ├── ext
    │           │   │   ├── autosectionlabel.cpython-313.pyc
    │           │   │   ├── doctest.cpython-313.pyc
    │           │   │   ├── ifconfig.cpython-313.pyc
    │           │   │   ├── imgmath.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── mathjax.cpython-313.pyc
    │           │   ├── extension.cpython-313.pyc
    │           │   ├── highlighting.cpython-313.pyc
    │           │   ├── __init__.cpython-313.pyc
    │           │   ├── io.cpython-313.pyc
    │           │   ├── jinja2glue.cpython-313.pyc
    │           │   ├── locale
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── parsers.cpython-313.pyc
    │           │   ├── project.cpython-313.pyc
    │           │   ├── pycode
    │           │   │   ├── ast.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   └── parser.cpython-313.pyc
    │           │   ├── pygments_styles.cpython-313.pyc
    │           │   ├── registry.cpython-313.pyc
    │           │   ├── roles.cpython-313.pyc
    │           │   ├── search
    │           │   │   ├── en.cpython-313.pyc
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── theming.cpython-313.pyc
    │           │   ├── transforms
    │           │   │   ├── compact_bullet_list.cpython-313.pyc
    │           │   │   ├── i18n.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── post_transforms
    │           │   │   │   ├── code.cpython-313.pyc
    │           │   │   │   ├── images.cpython-313.pyc
    │           │   │   │   └── __init__.cpython-313.pyc
    │           │   │   └── references.cpython-313.pyc
    │           │   ├── util
    │           │   │   ├── build_phase.cpython-313.pyc
    │           │   │   ├── cfamily.cpython-313.pyc
    │           │   │   ├── console.cpython-313.pyc
    │           │   │   ├── display.cpython-313.pyc
    │           │   │   ├── docfields.cpython-313.pyc
    │           │   │   ├── docutils.cpython-313.pyc
    │           │   │   ├── exceptions.cpython-313.pyc
    │           │   │   ├── fileutil.cpython-313.pyc
    │           │   │   ├── http_date.cpython-313.pyc
    │           │   │   ├── i18n.cpython-313.pyc
    │           │   │   ├── images.cpython-313.pyc
    │           │   │   ├── index_entries.cpython-313.pyc
    │           │   │   ├── __init__.cpython-313.pyc
    │           │   │   ├── inspect.cpython-313.pyc
    │           │   │   ├── inventory.cpython-313.pyc
    │           │   │   ├── _io.cpython-313.pyc
    │           │   │   ├── logging.cpython-313.pyc
    │           │   │   ├── matching.cpython-313.pyc
    │           │   │   ├── math.cpython-313.pyc
    │           │   │   ├── nodes.cpython-313.pyc
    │           │   │   ├── osutil.cpython-313.pyc
    │           │   │   ├── parallel.cpython-313.pyc
    │           │   │   ├── _pathlib.cpython-313.pyc
    │           │   │   ├── png.cpython-313.pyc
    │           │   │   ├── requests.cpython-313.pyc
    │           │   │   ├── rst.cpython-313.pyc
    │           │   │   ├── tags.cpython-313.pyc
    │           │   │   ├── template.cpython-313.pyc
    │           │   │   ├── texescape.cpython-313.pyc
    │           │   │   └── typing.cpython-313.pyc
    │           │   ├── versioning.cpython-313.pyc
    │           │   └── writers
    │           │       ├── html5.cpython-313.pyc
    │           │       ├── html.cpython-313.pyc
    │           │       ├── __init__.cpython-313.pyc
    │           │       ├── latex.cpython-313.pyc
    │           │       ├── manpage.cpython-313.pyc
    │           │       ├── texinfo.cpython-313.pyc
    │           │       ├── text.cpython-313.pyc
    │           │       └── xml.cpython-313.pyc
    │           ├── sphinxcontrib
    │           │   ├── devhelp
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── htmlhelp
    │           │   │   └── __init__.cpython-313.pyc
    │           │   ├── qthelp
    │           │   │   └── __init__.cpython-313.pyc
    │           │   └── serializinghtml
    │           │       ├── __init__.cpython-313.pyc
    │           │       └── jsonimpl.cpython-313.pyc
    │           └── urllib3
    │               ├── _collections.cpython-313.pyc
    │               ├── connection.cpython-313.pyc
    │               ├── connectionpool.cpython-313.pyc
    │               ├── contrib
    │               │   ├── _appengine_environ.cpython-313.pyc
    │               │   ├── __init__.cpython-313.pyc
    │               │   └── socks.cpython-313.pyc
    │               ├── exceptions.cpython-313.pyc
    │               ├── fields.cpython-313.pyc
    │               ├── filepost.cpython-313.pyc
    │               ├── __init__.cpython-313.pyc
    │               ├── packages
    │               │   ├── __init__.cpython-313.pyc
    │               │   └── six.cpython-313.pyc
    │               ├── poolmanager.cpython-313.pyc
    │               ├── request.cpython-313.pyc
    │               ├── response.cpython-313.pyc
    │               ├── util
    │               │   ├── connection.cpython-313.pyc
    │               │   ├── __init__.cpython-313.pyc
    │               │   ├── proxy.cpython-313.pyc
    │               │   ├── queue.cpython-313.pyc
    │               │   ├── request.cpython-313.pyc
    │               │   ├── response.cpython-313.pyc
    │               │   ├── retry.cpython-313.pyc
    │               │   ├── ssl_.cpython-313.pyc
    │               │   ├── ssl_match_hostname.cpython-313.pyc
    │               │   ├── ssltransport.cpython-313.pyc
    │               │   ├── timeout.cpython-313.pyc
    │               │   ├── url.cpython-313.pyc
    │               │   └── wait.cpython-313.pyc
    │               └── _version.cpython-313.pyc
    └── lib64
        └── python3.13
            ├── argparse.cpython-313.pyc
            ├── ast.cpython-313.pyc
            ├── base64.cpython-313.pyc
            ├── bdb.cpython-313.pyc
            ├── bisect.cpython-313.pyc
            ├── bz2.cpython-313.pyc
            ├── calendar.cpython-313.pyc
            ├── cmd.cpython-313.pyc
            ├── code.cpython-313.pyc
            ├── codeop.cpython-313.pyc
            ├── collections
            │   └── __init__.cpython-313.pyc
            ├── _colorize.cpython-313.pyc
            ├── _compat_pickle.cpython-313.pyc
            ├── _compression.cpython-313.pyc
            ├── configparser.cpython-313.pyc
            ├── contextlib.cpython-313.pyc
            ├── contextvars.cpython-313.pyc
            ├── copy.cpython-313.pyc
            ├── copyreg.cpython-313.pyc
            ├── csv.cpython-313.pyc
            ├── dataclasses.cpython-313.pyc
            ├── datetime.cpython-313.pyc
            ├── decimal.cpython-313.pyc
            ├── difflib.cpython-313.pyc
            ├── dis.cpython-313.pyc
            ├── doctest.cpython-313.pyc
            ├── email
            │   ├── base64mime.cpython-313.pyc
            │   ├── charset.cpython-313.pyc
            │   ├── _encoded_words.cpython-313.pyc
            │   ├── encoders.cpython-313.pyc
            │   ├── errors.cpython-313.pyc
            │   ├── feedparser.cpython-313.pyc
            │   ├── header.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── iterators.cpython-313.pyc
            │   ├── message.cpython-313.pyc
            │   ├── _parseaddr.cpython-313.pyc
            │   ├── parser.cpython-313.pyc
            │   ├── _policybase.cpython-313.pyc
            │   ├── quoprimime.cpython-313.pyc
            │   └── utils.cpython-313.pyc
            ├── encodings
            │   ├── aliases.cpython-313.pyc
            │   ├── idna.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── unicode_escape.cpython-313.pyc
            │   ├── utf_8.cpython-313.pyc
            │   └── utf_8_sig.cpython-313.pyc
            ├── enum.cpython-313.pyc
            ├── filecmp.cpython-313.pyc
            ├── fnmatch.cpython-313.pyc
            ├── functools.cpython-313.pyc
            ├── __future__.cpython-313.pyc
            ├── gettext.cpython-313.pyc
            ├── glob.cpython-313.pyc
            ├── gzip.cpython-313.pyc
            ├── hashlib.cpython-313.pyc
            ├── heapq.cpython-313.pyc
            ├── hmac.cpython-313.pyc
            ├── html
            │   ├── entities.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   └── parser.cpython-313.pyc
            ├── http
            │   ├── client.cpython-313.pyc
            │   ├── cookiejar.cpython-313.pyc
            │   ├── cookies.cpython-313.pyc
            │   └── __init__.cpython-313.pyc
            ├── importlib
            │   ├── _abc.cpython-313.pyc
            │   ├── abc.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── metadata
            │   │   ├── _collections.cpython-313.pyc
            │   │   ├── _functools.cpython-313.pyc
            │   │   ├── __init__.cpython-313.pyc
            │   │   ├── _itertools.cpython-313.pyc
            │   │   └── _meta.cpython-313.pyc
            │   └── resources
            │       ├── abc.cpython-313.pyc
            │       ├── _common.cpython-313.pyc
            │       ├── _functional.cpython-313.pyc
            │       └── __init__.cpython-313.pyc
            ├── inspect.cpython-313.pyc
            ├── ipaddress.cpython-313.pyc
            ├── json
            │   ├── decoder.cpython-313.pyc
            │   ├── encoder.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   └── scanner.cpython-313.pyc
            ├── keyword.cpython-313.pyc
            ├── linecache.cpython-313.pyc
            ├── locale.cpython-313.pyc
            ├── logging
            │   ├── handlers.cpython-313.pyc
            │   └── __init__.cpython-313.pyc
            ├── lzma.cpython-313.pyc
            ├── _markupbase.cpython-313.pyc
            ├── mimetypes.cpython-313.pyc
            ├── multiprocessing
            │   ├── connection.cpython-313.pyc
            │   ├── context.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── popen_fork.cpython-313.pyc
            │   ├── process.cpython-313.pyc
            │   ├── reduction.cpython-313.pyc
            │   └── util.cpython-313.pyc
            ├── numbers.cpython-313.pyc
            ├── opcode.cpython-313.pyc
            ├── _opcode_metadata.cpython-313.pyc
            ├── operator.cpython-313.pyc
            ├── optparse.cpython-313.pyc
            ├── pathlib
            │   ├── _abc.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   └── _local.cpython-313.pyc
            ├── pdb.cpython-313.pyc
            ├── pickle.cpython-313.pyc
            ├── platform.cpython-313.pyc
            ├── pprint.cpython-313.pyc
            ├── queue.cpython-313.pyc
            ├── quopri.cpython-313.pyc
            ├── random.cpython-313.pyc
            ├── re
            │   ├── _casefix.cpython-313.pyc
            │   ├── _compiler.cpython-313.pyc
            │   ├── _constants.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   └── _parser.cpython-313.pyc
            ├── reprlib.cpython-313.pyc
            ├── rlcompleter.cpython-313.pyc
            ├── selectors.cpython-313.pyc
            ├── shutil.cpython-313.pyc
            ├── signal.cpython-313.pyc
            ├── site-packages
            │   ├── markupsafe
            │   │   └── __init__.cpython-313.pyc
            │   └── PIL
            │       ├── _binary.cpython-313.pyc
            │       ├── _deprecate.cpython-313.pyc
            │       ├── ExifTags.cpython-313.pyc
            │       ├── Image.cpython-313.pyc
            │       ├── ImageMode.cpython-313.pyc
            │       ├── __init__.cpython-313.pyc
            │       ├── TiffTags.cpython-313.pyc
            │       ├── _typing.cpython-313.pyc
            │       ├── _util.cpython-313.pyc
            │       └── _version.cpython-313.pyc
            ├── socket.cpython-313.pyc
            ├── ssl.cpython-313.pyc
            ├── string.cpython-313.pyc
            ├── stringprep.cpython-313.pyc
            ├── struct.cpython-313.pyc
            ├── subprocess.cpython-313.pyc
            ├── sysconfig
            │   └── __init__.cpython-313.pyc
            ├── _sysconfigdata__linux_x86_64-linux-gnu.cpython-313.pyc
            ├── tempfile.cpython-313.pyc
            ├── textwrap.cpython-313.pyc
            ├── threading.cpython-313.pyc
            ├── token.cpython-313.pyc
            ├── tokenize.cpython-313.pyc
            ├── tomllib
            │   ├── __init__.cpython-313.pyc
            │   ├── _parser.cpython-313.pyc
            │   ├── _re.cpython-313.pyc
            │   └── _types.cpython-313.pyc
            ├── traceback.cpython-313.pyc
            ├── types.cpython-313.pyc
            ├── typing.cpython-313.pyc
            ├── unittest
            │   ├── case.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── loader.cpython-313.pyc
            │   ├── main.cpython-313.pyc
            │   ├── result.cpython-313.pyc
            │   ├── runner.cpython-313.pyc
            │   ├── signals.cpython-313.pyc
            │   ├── suite.cpython-313.pyc
            │   └── util.cpython-313.pyc
            ├── urllib
            │   ├── error.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── parse.cpython-313.pyc
            │   ├── request.cpython-313.pyc
            │   └── response.cpython-313.pyc
            ├── uuid.cpython-313.pyc
            ├── warnings.cpython-313.pyc
            ├── weakref.cpython-313.pyc
            ├── _weakrefset.cpython-313.pyc
            ├── xml
            │   ├── dom
            │   │   ├── domreg.cpython-313.pyc
            │   │   ├── __init__.cpython-313.pyc
            │   │   ├── minicompat.cpython-313.pyc
            │   │   ├── minidom.cpython-313.pyc
            │   │   ├── NodeFilter.cpython-313.pyc
            │   │   └── xmlbuilder.cpython-313.pyc
            │   ├── etree
            │   │   ├── ElementPath.cpython-313.pyc
            │   │   ├── ElementTree.cpython-313.pyc
            │   │   └── __init__.cpython-313.pyc
            │   ├── __init__.cpython-313.pyc
            │   ├── parsers
            │   │   ├── expat.cpython-313.pyc
            │   │   └── __init__.cpython-313.pyc
            │   └── sax
            │       ├── _exceptions.cpython-313.pyc
            │       ├── expatreader.cpython-313.pyc
            │       ├── handler.cpython-313.pyc
            │       ├── __init__.cpython-313.pyc
            │       ├── saxutils.cpython-313.pyc
            │       └── xmlreader.cpython-313.pyc
            ├── zipfile
            │   ├── __init__.cpython-313.pyc
            │   └── _path
            │       ├── glob.cpython-313.pyc
            │       └── __init__.cpython-313.pyc
            └── zoneinfo
                ├── _common.cpython-313.pyc
                ├── __init__.cpython-313.pyc
                └── _tzpath.cpython-313.pyc

109 directories, 634 files

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 8c1f6a3dfc44..59e95ebae786 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -84,7 +84,7 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
-	PYTHONDONTWRITEBYTECODE=1 \
+	PYTHONPYCACHEPREFIX=$(abspath $(BUILDDIR)/__pycache__) \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
 	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
-- 
2.49.0

